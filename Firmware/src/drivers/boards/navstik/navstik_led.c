/****************************************************************************
 *
 *   Copyright (C) 2013 Navstik Development Team. All rights reserved.
 *   Copyright (C) 2012 PX4 Development Team. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name PX4 nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

/**
 * @file navstik_led.c
 *
 * Navstik LED backend.
 */

#include <nuttx/config.h>

#include <stdint.h>
#include <stdbool.h>
#include <debug.h>

#include <arch/board/board.h>

#include "chip.h"
#include "up_arch.h"
#include "up_internal.h"
#include "stm32.h"
#include "navstik_internal.h"

__EXPORT void led_init()
{
	/* Configure LED1-2 GPIOs for output */

	stm32_configgpio(GPIO_LED1);
	stm32_configgpio(GPIO_LED2);
}

__EXPORT void led_on(int led)
{
	if (led == 0)
	{
		/* Pull up to switch on */
		stm32_gpiowrite(GPIO_LED1, true);
	}
	if (led == 1)
	{
		/* Pull up to switch on */
		stm32_gpiowrite(GPIO_LED2, true);
	}
}

__EXPORT void led_off(int led)
{
	if (led == 0)
	{
		/* Pull down to switch off */
		stm32_gpiowrite(GPIO_LED1, false);
	}
	if (led == 1)
	{
		/* Pull down to switch off */
		stm32_gpiowrite(GPIO_LED2, false);
	}
}
