function centerWindowInFrame( window, targetFrame ) {
    var windowFrame = window.frame(),
    targetFrameCenter = {x: targetFrame.x + targetFrame.width / 2, y: targetFrame.y + targetFrame.height / 2};
    window.setTopLeft( {x: targetFrameCenter.x - windowFrame.width / 2, y: targetFrameCenter.y - windowFrame.height / 2} );
}

function maximizeWindowInFrame( window, targetFrame ) {
    window.setFrame( targetFrame );
}

function windowFitsInFrame( window, targetFrame ) {
    var windowFrame = window.frame();
    return ( windowFrame.width <= targetFrame.width && windowFrame.height <= targetFrame.height );
}

function bindLaunch( key, modifiers, appName ) {
    api.bind( key, modifiers, function() {
        api.launch( appName );
    } );
}

function frameOfNextScreen( window ) {
    if ( ! window || ! window.screen().nextScreen() ) {
        return;
    }
    return window.screen().nextScreen().frameWithoutDockOrMenu();
}

var debugMode = true;
function debug( message ) {
    if ( debugMode ) api.alert( message );
}

/***********************************************
 * BINDINGS
 ***********************************************/

debugMode = false;

var triple = ['ctrl','alt','cmd'];

api.bind( 'space', triple, function() {
    debug( 'Maximizing current window' );
    Window.focusedWindow().maximize();
} );

api.bind( 't', triple, function() {
    debug( 'Showing title' );
    api.alert( Window.focusedWindow().app().title(), 3 );
} );

api.bind( 'w', triple, function() {
    debug( 'Moving to top-left' );
    var win = Window.focusedWindow(),
    screenFrame = win.screen().frameWithoutDockOrMenu();
    win.setTopLeft( {x: screenFrame.x, y: screenFrame.y} );
} );

api.bind( 'l', triple, function() {
    debug( 'Moving to left-half' );
    var win = Window.focusedWindow(),
    screenFrame = win.screen().frameWithoutDockOrMenu();
    win.setFrame( {x: screenFrame.x, y: screenFrame.y, width: screenFrame.width / 2, height: screenFrame.height} );
} );

api.bind( 'r', triple, function() {
    debug( 'Moving to right-half' );
    var win = Window.focusedWindow(),
    screenFrame = win.screen().frameWithoutDockOrMenu();
    win.setFrame( {x: screenFrame.x + screenFrame.width / 2, y: screenFrame.y, width: screenFrame.width / 2, height: screenFrame.height} );
} );

bindLaunch( '/', ['cmd'], 'iTerm' );
bindLaunch( '.', ['cmd'], 'Slack' );
bindLaunch( '.', ['cmd', 'shift'], 'Skype' );
