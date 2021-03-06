<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <link rel="stylesheet" href="../../css/switcher/default.css" type="text/css">
    </head>
    <body>
        <a name="top"></a>
        <div id="pagecontainer">
        <!-- testata -->
        <div id="header">
            <template_field class="microtemplate_field" name="header">header</template_field>
        </div>
        <!-- / testata -->
        <!-- menu -->
            <template_field class="microtemplate_field" name="adamenu">adamenu</template_field>
        <!-- / menu -->
        <!-- contenitore -->
        <div id="container">
            <!-- PERCORSO -->
            <div id="journey" class="ui tertiary inverted teal segment">
                <i18n>dove sei: </i18n>
                <span>
                    <!--template_field class="template_field" name="course_title">course_title</template_field-->
                    <template_field class="template_field" name="label">label</template_field>
                </span>
            </div>
            <div id="user_wrap">
                <div id="status_bar">
                    <!--dati utente-->
                    <div id="user_data" class="user_data_default">
                        <i18n>utente: </i18n>
                        <span>
                            <template_field class="template_field" name="user_name">user_name</template_field>
                        </span>
                        <i18n>tipo: </i18n>
                        <span>
                            <template_field class="template_field" name="user_type">user_type</template_field>
                        </span>
                        <div class="status">
                            <i18n>status: </i18n>
                            <span>
                                <template_field class="template_field" name="status">status</template_field>
                            </span> </div>
                    </div>
                    <!-- / dati utente -->
                    <!-- label -->
                    <!--div id="label">
                        <div class="topleft">
                            <div class="topright">
                                <div class="bottomleft">
                                    <div class="bottomright">
                                        <div class="contentlabel">
                                            <h1>
                                                <template_field class="template_field" name="label">label</template_field>
                                            </h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /label -->
                </div>
            </div>

            <!-- contenuto -->
            <div id="content">
                <div id="contentcontent">
                    <div class="first">
                        <div id="help">
                            <template_field class="template_field" name="help">help</template_field>
                        </div>
                        <template_field class="template_field" name="data">data</template_field>
                    </div>
                </div>
            </div>
            <!--  / contenuto -->
        </div>
        <!-- / contenitore -->
     	<div id="push"></div>
		</div>

		<!-- com_tools -->
        <div class="clearfix"></div>
        <div id="com_tools">
            <div id="com_toolscontent">
                <template_field class="microtemplate_field" name="com_tools">com_tools</template_field>
            </div>
        </div>
        <!-- /com_tools -->

        <!-- piede -->
        <div id="footer">
            <template_field class="microtemplate_field" name="footer">footer</template_field>
        </div>
        <!-- / piede -->

        <span id="emptyURLMSG" style="display:none;"><i18n>Inserire una url da cui importare</i18n></span>
        <span id="exportoToRepoMustSelect" style="display:none;"><i18n>Selezionare un nodo da esportare</i18n></span>
        <span id="exportoToRepoNodelbl" style="display:none;"><i18n>Nodo</i18n></span>
        <span id="exportoToRepoBaseDescr" style="display:none;"><i18n>Esportazione dal corso</i18n></span>

    </body>
</html>
