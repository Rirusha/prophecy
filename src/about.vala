/*
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

namespace Prophecy {
    Adw.AboutDialog build_about () {
        return new Adw.AboutDialog () {
            application_name = _("Prophecy"),
            application_icon = Config.APP_ID,
            developer_name = "Vladimir Vaskov",
            developers = {
                "Cassidy James Blaede <c@ssidyjam.es>",
                "Vladimir Vaskov <rirusha@altlinux.org>"
            },
            artists = {},
            version = Config.VERSION,
            // Translators: NAME <EMAIL.COM> /n NAME <EMAIL.COM>
            translator_credits = _("translator-credits"),
            license_type = Gtk.License.GPL_3_0,
            copyright = "© 2024 Vladimir Vaskov",
            release_notes_version = Config.VERSION
        };
    }
}
