{
  programs.waybar.style = 
    ''* {
        border: none;
        border-radius: 0;
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FiraCode Nerd Font;
        min-height: 0;
        font-size: 14px;
        color: rgb(200,250,200);
    }

    window#waybar {
        background-color: rgba(4,4,5,0.6);
        color: #ebdbb2;
    }
    /**/
    /* window#waybar.hidden { */
    /*     opacity: 0.2; */
    /* } */

    #workspaces {
        margin-right: 6px;
        border-radius: 6px;
        background: #4e635b;
    }

    #workspaces button {
        color: #7c818c;
        background: transparent;
        padding: 5px;
        font-size: 12px;
        background: #32302f;
    }

    #workspaces button.persistent {
        color: #7c818c;
        font-size: 12px;
    }

    #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        color: #504945;
    }

    #workspaces button.active {
        background: #4e635b;
        color: white;
        border-radius: inherit;
    }

    #language {
        padding-left: 0;
        padding-right: 0px;
        margin-right: 6px;
        border-radius: 6px;
        background: #32302f;
    }

    #network {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 12px;
        border-radius:6px;
        background: #32302f;
    }

    #submap {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 6px;
        transition: none;

        background: #383c4a;
    }

    #clock {
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 6px 0px 0px 6px;
        background: #32302f;
    }

    #custom-weather {
        padding-right: 6px;
        border-radius: 0px 6px 6px 0px;
        background: #32302f;
    }

    #pulseaudio {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 6px;
        background: #32302f;
    }

    #pulseaudio.muted {
        background-color: #cc241d;
        color: #2a5c45;
    }

    #custom-mem {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 6px;
        background: #32302f;
    }

    #cpu {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 6px;
        background: #32302f; 
    }

    #temperature {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 6px;
        background: #32302f;
    }

    #temperature.critical {
        background-color: #eb4d4b;
    }

    #backlight {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 8px;
        border-radius: 6px;
        transition: none;
        background: #32302f;
    }

    #battery {
        margin-right: 6px;
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 6px;
        background: #32302f;
    }

    #battery.charging {
        color: #ffffff;
        background-color: #26A65B;
    }

    #battery.warning:not(.charging) {
        background-color: #ffbe61;
        color: black;
    }

    #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #tray {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 6px;
        transition: none;
        color: #ffffff;
        background: #32302f;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }
  '';
}
