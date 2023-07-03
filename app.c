/***************************************************************************//**
 * @file
 * @brief Core application logic.
 *******************************************************************************
 * # License
 * <b>Copyright 2021 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include "em_common.h"
#include "app_assert.h"
#include "app_log.h"
#include "sl_bluetooth.h"
#include "gatt_db.h"
#include "app.h"
#include "sl_simple_button_instances.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sl_pwm.h"
#include "sl_pwm_instances.h"
#include "sl_pwm_init_led0_config.h"

// The advertising set handle allocated from Bluetooth stack.
static uint8_t advertising_set_handle = 0xff;

static bool report_button_flag = false;

// Updates the Report Button characteristic.
static sl_status_t update_report_button_characteristic(void);
// Sends notification of the Report Button characteristic.
static sl_status_t send_report_button_notification(void);
#define MAX_BUFFER_SIZE 256

// Buffer to store the read value
static uint8_t readBuffer[MAX_BUFFER_SIZE];
static uint16_t readBufferSize = 0;

uint8_t pwm = 0;
uint8_t ledout_reg = 0xAA;
sl_pwm_instance_t sl_pwm_led1 = {
    .timer = SL_PWM_LED1_PERIPHERAL,
    .channel = (uint8_t)(SL_PWM_LED1_OUTPUT_CHANNEL),
    .port = (uint8_t)(SL_PWM_LED1_OUTPUT_PORT),
    .pin = (uint8_t)(SL_PWM_LED1_OUTPUT_PIN),
  #if defined(SL_PWM_LED1_OUTPUT_LOC)
    .location = (uint8_t)(SL_PWM_LED1_OUTPUT_LOC),
  #endif
  };


sl_pwm_instance_t sl_pwm_led2 = {
      .timer = SL_PWM_LED2_PERIPHERAL,
      .channel = (uint8_t)(SL_PWM_LED2_OUTPUT_CHANNEL),
      .port = (uint8_t)(SL_PWM_LED2_OUTPUT_PORT),
      .pin = (uint8_t)(SL_PWM_LED2_OUTPUT_PIN),
    #if defined(SL_PWM_LED2_OUTPUT_LOC)
      .location = (uint8_t)(SL_PWM_LED2_OUTPUT_LOC),
    #endif
    };


sl_pwm_instance_t sl_pwm_led3 = {
             .timer = SL_PWM_LED3_PERIPHERAL,
             .channel = (uint8_t)(SL_PWM_LED3_OUTPUT_CHANNEL),
             .port = (uint8_t)(SL_PWM_LED3_OUTPUT_PORT),
             .pin = (uint8_t)(SL_PWM_LED3_OUTPUT_PIN),
           #if defined(SL_PWM_LED3_OUTPUT_LOC)
             .location = (uint8_t)(SL_PWM_LED3_OUTPUT_LOC),
           #endif
           };


void initPWM() {





  sl_pwm_config_t pwm_led1_config = {
       .frequency = SL_PWM_LED1_FREQUENCY,
       .polarity = SL_PWM_LED1_POLARITY,
     };

     sl_pwm_init(&sl_pwm_led1, &pwm_led1_config);






       sl_pwm_config_t pwm_led2_config = {
            .frequency = SL_PWM_LED2_FREQUENCY,
            .polarity = SL_PWM_LED2_POLARITY,
          };

          sl_pwm_init(&sl_pwm_led2, &pwm_led2_config);






            sl_pwm_config_t pwm_led3_config = {
                 .frequency = SL_PWM_LED3_FREQUENCY,
                 .polarity = SL_PWM_LED3_POLARITY,
               };

               sl_pwm_init(&sl_pwm_led3, &pwm_led3_config);

}

/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{
  // Make sure there will be no button events before the boot event.
  sl_button_disable(SL_SIMPLE_BUTTON_INSTANCE(0));
  initPWM();
  sl_pwm_start(&sl_pwm_led0);
  sl_pwm_start(&sl_pwm_led1);
  sl_pwm_start(&sl_pwm_led2);
  sl_pwm_start(&sl_pwm_led3);


  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application init code here!                         //
  // This is called once during start-up.                                    //
  /////////////////////////////////////////////////////////////////////////////
}

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
SL_WEAK void app_process_action(void)
{
  // Check if there was a report button interaction.
  if (report_button_flag) {
    sl_status_t sc;

    report_button_flag = false; // Reset flag

    sc = update_report_button_characteristic();
    app_log_status_error(sc);

    if (sc == SL_STATUS_OK) {
      sc = send_report_button_notification();
      app_log_status_error(sc);
    }
  }

  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application code here!                              //
  // This is called infinitely.                                              //
  // Do not call blocking functions from here!                               //
  /////////////////////////////////////////////////////////////////////////////
}


char* process_received_text(char* text, uint16_t length)
{
    // Convert the received text to a string
    char receivedString[length + 1];
    memcpy(receivedString, text, length);
    receivedString[length] = '\0';
    return receivedString;
}


/**************************************************************************//**
 * Bluetooth stack event handler.
 * This overrides the dummy weak implementation.
 *
 * @param[in] evt Event coming from the Bluetooth stack.
 *****************************************************************************/
void sl_bt_on_event(sl_bt_msg_t *evt)
{
  sl_status_t sc;

  switch (SL_BT_MSG_ID(evt->header)) {
    // -------------------------------
    // This event indicates the device has started and the radio is ready.
    // Do not call any stack command before receiving this boot event!
    case sl_bt_evt_system_boot_id:
      // Create an advertising set.
      sc = sl_bt_advertiser_create_set(&advertising_set_handle);
      app_assert_status(sc);

      // Generate data for advertising
      sc = sl_bt_legacy_advertiser_generate_data(advertising_set_handle,
                                                 sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      // Set advertising interval to 100ms.
      sc = sl_bt_advertiser_set_timing(
        advertising_set_handle,
        160, // min. adv. interval (milliseconds * 1.6)
        160, // max. adv. interval (milliseconds * 1.6)
        0,   // adv. duration
        0);  // max. num. adv. events
      app_assert_status(sc);

      // Start advertising and enable connections.
      sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                         sl_bt_advertiser_connectable_scannable);
      app_assert_status(sc);

      // Button events can be received from now on.
      sl_button_enable(SL_SIMPLE_BUTTON_INSTANCE(0));

      // Check the report button state, then update the characteristic and
      // send notification.
      sc = update_report_button_characteristic();
      app_log_status_error(sc);

      if (sc == SL_STATUS_OK) {
        sc = send_report_button_notification();
        app_log_status_error(sc);
      }
      break;

    // -------------------------------
    // This event indicates that a new connection was opened.
    case sl_bt_evt_connection_opened_id:
      app_log_info("Connection opened.\n");
      break;

    // -------------------------------
    // This event indicates that a connection was closed.
    case sl_bt_evt_connection_closed_id:
      app_log_info("Connection closed.\n");

      // Generate data for advertising
      sc = sl_bt_legacy_advertiser_generate_data(advertising_set_handle,
                                                 sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      // Restart advertising after client has disconnected.
      sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                         sl_bt_advertiser_connectable_scannable);
      app_assert_status(sc);
      break;

    // -------------------------------
    // This event indicates that the value of an attribute in the local GATT
    // database was changed by a remote GATT client.
    case sl_bt_evt_gatt_server_attribute_value_id:
      // The value of the gattdb_led_control characteristic was changed.
      if (gattdb_data_reciever == evt->data.evt_gatt_server_attribute_value.attribute) {
        char receivedText [evt->data.evt_gatt_server_attribute_value.value.len+1];
        memcpy(readBuffer, evt->data.evt_gatt_server_attribute_value.value.data,
               evt->data.evt_gatt_server_attribute_value.value.len);

        memcpy(receivedText, readBuffer, evt->data.evt_gatt_server_attribute_value.value.len);

       receivedText[evt->data.evt_gatt_server_attribute_value.value.len] = '\0';

        if (0 == strcmp(receivedText,"SWON")) {
            switchSW(true);
        } else if (0 == strcmp(receivedText,"SWOFF")) {
            switchSW(false);
        } else if (strstr(receivedText, "PWM") != NULL && strchr(receivedText, '=') == receivedText + 3) {
                    const char* sub_str = receivedText + 4;
                    int ret_int = set_pwm(sub_str);
                    if (ret_int == 1)
                        printf("OK\n");
                    else
                        printf("FAIL\n");
                }
        }

      app_log_info("Command came\n");
      app_log_info(evt->data.evt_gatt_server_attribute_value.attribute);
      break;

    case sl_bt_evt_gatt_server_characteristic_status_id:
      if (gattdb_report_button == evt->data.evt_gatt_server_characteristic_status.characteristic) {
        // A local Client Characteristic Configuration descriptor was changed in
        // the gattdb_report_button characteristic.
        if (evt->data.evt_gatt_server_characteristic_status.client_config_flags
            & sl_bt_gatt_notification) {
          // The client just enabled the notification. Send notification of the
          // current button state stored in the local GATT table.
          app_log_info("Notification enabled.");

          sc = send_report_button_notification();
          app_log_status_error(sc);
        } else {
          app_log_info("Notification disabled.\n");
        }
      }
      break;

    ///////////////////////////////////////////////////////////////////////////
    // Add additional event handlers here as your application requires!      //
    ///////////////////////////////////////////////////////////////////////////

    // -------------------------------
    // Default event handler.
    default:
      break;
  }
}


char* getValue(const char* data, char separator, int index) {
    char* copy = strdup(data);
    char* token = strtok(copy, &separator);
    int found = 0;

    while (token != NULL) {
        if (found == index) {
            return token;
        }
        token = strtok(NULL, &separator);
        found++;
    }

    free(copy);
    return "";
}


int set_pwm(char* sub_str) {
  int ret = -1;
  for (int i = 0; i < 2; i++) {
    if (getValue(sub_str, ',', i) == NULL) {
      ret = 0;
      break;
    }
  }
  if (ret != 0) {
    char* channel = getValue(sub_str, ',', 0);
    char* dc_str = getValue(sub_str, ',', 1);
    float dc = atof(dc_str);
    uint8_t ch = atoi(channel);
    uint8_t mask = (3 << ch * 2) ^ 255;  // mask for LED output register 0x8
#ifdef DEBUG
    printf("%d\n", mask);
#endif
    if (dc > 100) {
      ledout_reg = (ledout_reg & mask) | (1 << ch * 2);
    } else {
      pwm = dc;
      ledout_reg = (ledout_reg & mask) | (2 << ch * 2);
    }

    printf("PWM programming value:\n");
    printf("%f\n", pwm);

    if(ch == 0) {
        sl_pwm_set_duty_cycle(&sl_pwm_led0,pwm);
    } else if(ch == 1) {
        sl_pwm_set_duty_cycle(&sl_pwm_led1,pwm);
    } else if(ch == 2) {
        sl_pwm_set_duty_cycle(&sl_pwm_led2,pwm);
    } else if(ch == 3) {
        sl_pwm_set_duty_cycle(&sl_pwm_led3,pwm);
    }

    ret = 1;
  }
  return ret;
}


//
//
//char* substring(char *destination, const char *source, int beg, int n)
//{
//    // extracts `n` characters from the source string starting from `beg` index
//    // and copy them into the destination string
//    while (n > 0)
//    {
//        *destination = *(source + beg);
//
//        destination++;
//        source++;
//        n--;
//    }
//
//    // null terminate destination string
//    *destination = '\0';
//
//    // return the destination string
//    return destination;
//}



int setPWM(char command[]) {
  printf("%s\n",command);
  return 0;
}


void switchSW(const bool switchON) {
  if(switchON) {
      sl_pwm_set_duty_cycle(&sl_pwm_led0, 0x64);
//      sl_led_turn_on(SL_SIMPLE_LED_INSTANCE(0));
  } else {
      sl_pwm_set_duty_cycle(&sl_pwm_led0, 0);
//      sl_led_turn_off(SL_SIMPLE_LED_INSTANCE(0));
  }
}

/***************************************************************************//**
 * Simple Button
 * Button state changed callback
 * @param[in] handle Button event handle
 ******************************************************************************/
void sl_button_on_change(const sl_button_t *handle)
{
  if (SL_SIMPLE_BUTTON_INSTANCE(0) == handle) {
    report_button_flag = true;
  }
}

/***************************************************************************//**
 * Updates the Report Button characteristic.
 *
 * Checks the current button state and then writes it into the local GATT table.
 ******************************************************************************/
static sl_status_t update_report_button_characteristic(void)
{
  sl_status_t sc;
  uint8_t data_send;

  switch (sl_button_get_state(SL_SIMPLE_BUTTON_INSTANCE(0))) {
    case SL_SIMPLE_BUTTON_PRESSED:
      data_send = (uint8_t)SL_SIMPLE_BUTTON_PRESSED;
      break;

    case SL_SIMPLE_BUTTON_RELEASED:
      data_send = (uint8_t)SL_SIMPLE_BUTTON_RELEASED;
      break;

    default:
      // Invalid button state
      return SL_STATUS_FAIL; // Invalid button state
  }

  // Write attribute in the local GATT database.
  sc = sl_bt_gatt_server_write_attribute_value(gattdb_report_button,
                                               0,
                                               sizeof(data_send),
                                               &data_send);
  if (sc == SL_STATUS_OK) {
    app_log_info("Attribute written: 0x%02x", (int)data_send);
  }

  return sc;
}

/***************************************************************************//**
 * Sends notification of the Report Button characteristic.
 *
 * Reads the current button state from the local GATT database and sends it as a
 * notification.
 ******************************************************************************/
static sl_status_t send_report_button_notification(void)
{
  sl_status_t sc;
  uint8_t data_send;
  size_t data_len;

  // Read report button characteristic stored in local GATT database.
  sc = sl_bt_gatt_server_read_attribute_value(gattdb_report_button,
                                              0,
                                              sizeof(data_send),
                                              &data_len,
                                              &data_send);
  if (sc != SL_STATUS_OK) {
    return sc;
  }

  // Send characteristic notification.
  sc = sl_bt_gatt_server_notify_all(gattdb_report_button,
                                    sizeof(data_send),
                                    &data_send);
  if (sc == SL_STATUS_OK) {
    app_log_append(" Notification sent: 0x%02x\n", (int)data_send);
  }
  return sc;
}
