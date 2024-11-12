/*
 * Copyright 2018–2024 Cassidy James Blaede <c@ssidyjam.es>
 * Copyright 2024 Vladimir Vaskov <rirusha@altlinux.org>
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

[GtkTemplate (ui = "/space/rirusha/prophecy/ui/window.ui")]
public class Prophecy.Window : Adw.ApplicationWindow {

    [GtkChild]
    unowned FortuneLabel fortune_label;

    public Window (Gtk.Application application) {
        Object (
            application: application,
            icon_name: Config.APP_ID
        );
    }

    construct {
        set_focus (this);
    }

    [GtkCallback]
    void on_about_clicked () {
        var about_dialog = build_about ();
        about_dialog.present (this);
    }

    [GtkCallback]
    void on_ask_clicked () {
        fortune_label.randomize ();
    }
}
