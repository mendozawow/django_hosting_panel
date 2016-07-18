Ext.application({
    name: 'AdminPanel',
    appFolder: '/static/extjs/js/app',
    autoCreateViewport: 'AdminPanel.view.Viewport',

    // To showcase we will only use Domain and Record
    models: ['Domain', 'Record'],
    stores: ['Domains', 'Records']
    //models: ['Vhost','Domain','Mail','Record','FtpUser','Process'],
    //stores: ['Vhosts','Domains','Mails','Records','FtpUsers','Processes']
});