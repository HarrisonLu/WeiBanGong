package com.weixin.sdk.message;

public interface IMessage {

    // message type comes from
    public static final String MESSAGE_TEXT = "text";
    public static final String MESSAGE_IMAGE = "image";
    public static final String MESSAGE_VOICE = "voice";
    public static final String MESSAGE_VIDEO = "video";
    public static final String MESSAGE_LOCATION = "location";
    public static final String MESSAGE_LINK = "link";
    public static final String MESSAGE_EVENT = "event";

    // message response to user
    public static final String MESSAGE_RESULT_TEXT = "text";
    public static final String MESSAGE_RESULT_MUSIC = "music";
    public static final String MESSAGE_RESULT_NEWS = "news";

    // event types
    public static final String EVENT_CLICK = "CLICK";
    public static final String EVENT_SUBSCRIBE = "subscribe";
    public static final String EVENT_UNSUBSCRIBE = "unsubscribe";

    // message body tag
    public static final String TAG_XML = "xml";
    public static final String TAG_ITEM = "item";
    public static final String TAG_TOUSERNAME = "ToUserName";
    public static final String TAG_FROMUSERNAME = "FromUserName";
    public static final String TAG_CREATETIME = "CreateTime";
    public static final String TAG_MSGTYPE = "MsgType";
    public static final String TAG_CONTENT = "Content";
    public static final String TAG_MSGID = "MsgId";
    public static final String TAG_PICURL = "PicUrl";
    public static final String TAG_MEDIAID = "MediaId";
    public static final String TAG_FORMAT = "Format";
    public static final String TAG_RECOGNITION = "Recognition";
    public static final String TAG_MUSIC = "Music";
    public static final String TAG_MUSICURL = "MusicURL";
    public static final String TAG_HQMUSICURL = "HQMusicUrl";
    public static final String TAG_THUMBMEDIAID = "ThumbMediaId";
    public static final String TAG_LOCATIONX = "Location_X";
    public static final String TAG_LOCATIONY = "Location_Y";
    public static final String TAG_SCALE = "Scale";
    public static final String TAG_LABEL = "Label";
    public static final String TAG_TITLE = "Title";
    public static final String TAG_DESCRIPTION = "Description";
    public static final String TAG_URL = "Url";
    public static final String TAG_EVENT = "Event";
    public static final String TAG_EVENTKEY = "EventKey";
    public static final String TAG_TICKET = "Ticket";
    public static final String TAG_LATITUDE = "Latitude";
    public static final String TAG_LONGITUDE = "Longitude";
    public static final String TAG_PRECISION = "Precision";
    public static final String TAG_ARTICLECOUNT = "ArticleCount";
    public static final String TAG_ARTICLES = "Articles";
    public static final String TAG_FUNCFLAG = "FuncFlag";

    // Menu
    public static final String MENU_PARENT_KEY1 = "1";
    public static final String MENU_PARENT_KEY2 = "2";
    public static final String MENU_PARENT_KEY3 = "3";

    public static final String MENU_SUB_KEY11 = "11";
    public static final String MENU_SUB_KEY12 = "12";
    public static final String MENU_SUB_KEY13 = "13";
    public static final String MENU_SUB_KEY14 = "14";
    public static final String MENU_SUB_KEY15 = "15";

    public static final String MENU_SUB_KEY21 = "21";
    public static final String MENU_SUB_KEY22 = "22";
    public static final String MENU_SUB_KEY23 = "23";
    public static final String MENU_SUB_KEY24 = "24";
    public static final String MENU_SUB_KEY25 = "25";

    public static final String MENU_SUB_KEY31 = "31";
    public static final String MENU_SUB_KEY32 = "32";
    public static final String MENU_SUB_KEY33 = "33";
    public static final String MENU_SUB_KEY34 = "34";
    public static final String MENU_SUB_KEY35 = "35";

}
