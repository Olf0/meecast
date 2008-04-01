/*
 * This file is part of Other Maemo Weather(omweather)
 *
 * Copyright (C) 2006 Vlad Vasiliev
 * Copyright (C) 2006 Pavel Fialko
 * 	for the code
 *        
 * Copyright (C) 2008 Andrew Zhilin
 *		      az@pocketpcrussia.com 
 *	for default icon set (Glance)
 *
 * This software is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA
*/
/*******************************************************************************/
#ifndef _weather_popup_h
#define _weather_popup_h 1
/*******************************************************************************/
#include "weather-common.h"
#include "weather-data.h"
/*******************************************************************************/
extern	gchar		path_large_icon[];
/*******************************************************************************/
void popup_window_destroy(void);
gboolean popup_window_event_cb(GtkWidget *widget, GdkEvent *event, 
                    		    gpointer user_data);
gboolean show_popup_window_handler(GtkWidget *widget, GdkEvent *event,
				    gpointer user_data);
void popup_window_more_close(GtkWidget *widget, GdkEvent *event,
                    	    	    gpointer user_data);
GtkWidget* create_header_widget(GSList *day);
GtkWidget* create_temperature_range_widget(GSList *day);
GtkWidget* create_current_weather_widget(GSList *current);
GtkWidget* create_24_hours_widget(GSList *day);
GtkWidget* create_footer_widget(gboolean enable_more_info);
GtkWidget* create_footer_more_widget(void);
GtkWidget* create_sun_time_widget(GSList *day);
GtkWidget* create_moon_phase_widget(GSList *current);
GtkWidget* create_time_updates_widget(GSList *current);
float convert_wind_units(int to, float value);
void popup_window_more_show(GtkWidget *widget, GdkEvent *event, gpointer user_data);
void weather_window_popup_more_show(void);
void popup_close(GtkWidget *widget, GdkEvent *event, gpointer user_data);
/*******************************************************************************/
extern void weather_window_settings(GtkWidget *widget, GdkEvent *event,
				    gpointer user_data);
extern void weather_window_settings_021(GtkWidget *widget, GdkEvent *event,
				    gpointer user_data);
extern void pre_update_weather(void);
extern void set_font_size(GtkWidget *widget, char font_size);
extern void set_font_color (GtkWidget *widget, guint16 red, guint16 green, guint16 blue);
extern int c2f(int temp);
extern void swap_temperature(int *hi, int *low);
extern gpointer hash_table_find(gpointer key);
/*******************************************************************************/
#endif
