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

[GtkTemplate (ui = "/space/rirusha/prophecy/ui/fortune-label.ui")]
public class Prophecy.FortuneLabel : Adw.Bin {

    [GtkChild]
    unowned Gtk.Stack stack;

    struct Content {
        string title;
        string css_class;
    }

    static Content[] contents = {
        Content () {
            ///TRANSLATORS: Positive response, the thing is certain to happen
            title = _("It is certain."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("It is decidedly so."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("Without a doubt."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response, the thing is certain to happen
            title = _("Yes—definitely."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("You may rely on it."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("As I see it, yes."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("Most likely."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("Outlook good."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("Yes."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("Signs point to yes."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response, casual
            title = _("Yep!"),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response
            title = _("Absolutely!"),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Positive response, casual
            title = _("You bet!"),
            css_class = "success"
        },
        Content () {
            title = _("Confirmed."),
            css_class = "success"
        },
        Content () {
            ///TRANSLATORS: Negative response
            title = _("Don’t count on it."),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Negative response
            title = _("My reply is no."),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Negative response, referring to the 8-ball's "sources"
            title = _("My sources say no."),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Negative response
            title = _("Outlook not so good."),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Negative response
            title = _("Very doubtful."),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Negative response, casual
            title = _("Naw."),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Negative response; reference to the recurring Star Wars line
            title = _("I’ve got a bad feeling about this…"),
            css_class = "error"
        },
        Content () {
            ///TRANSLATORS: Neutral response
            title = _("Reply hazy, try again."),
            css_class = "warning"
        },
        Content () {
            ///TRANSLATORS: Neutral response
            title = _("Ask again later."),
            css_class = "warning"
        },
        Content () {
            ///TRANSLATORS: Neutral response
            title = _("Better not tell you now."),
            css_class = "warning"
        },
        Content () {
            ///TRANSLATORS: Neutral response
            title = _("Cannot predict now."),
            css_class = "warning"
        },
        Content () {
            ///TRANSLATORS: Neutral response
            title = _("Concentrate and ask again."),
            css_class = "warning"
        },
        Content () {
            ///TRANSLATORS: Neutral response; reference to a line from Yoda from Star Wars
            title = _("Impossible to see, the future is."),
            css_class = "warning"
        },
        Content () {
            ///TRANSLATORS: Neutral response; a play on the "404 Page Not Found" web browser error code
            title = _("404 Answer Not Found"),
            css_class = "warning"
        },
    };

    construct {
        for (int i = 0; i < contents.length; i++) {
            var title_label = new Gtk.Label (contents[i].title) {
                css_classes = { "title-1", contents[i].css_class },
                selectable = true,
                wrap = true,
                wrap_mode = Pango.WrapMode.WORD,
                justify = Gtk.Justification.CENTER,
            };

            stack.add_named (title_label, i.to_string ());
        }

        stack.visible_child_name = Random.int_range (0, contents.length).to_string ();
    }

    public void randomize () {
        string new_rand = stack.visible_child_name;

        while (new_rand == stack.visible_child_name) {
            new_rand = Random.int_range (0, contents.length).to_string ();
        }

        stack.visible_child_name = new_rand;
    }
}
