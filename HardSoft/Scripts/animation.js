// Imagen spinner
var cSpeed = 7;
var cWidth = 80;
var cHeight = 80;
var cTotalFrames = 75;
var cFrameWidth = 80;
var cImageSrc = '/images/sprites.png';

var cImageTimeout = false;
var cIndex = 0;
var cXpos = 0;
var cPreloaderTimeout = false;
var SECONDS_BETWEEN_FRAMES = 0;

function startAnimation() {

    document.getElementById('preload').style.backgroundImage = 'url(' + cImageSrc + ')';
    document.getElementById('preload').style.width = cWidth + 'px';
    document.getElementById('preload').style.height = cHeight + 'px';

    FPS = Math.round(100 / cSpeed);
    SECONDS_BETWEEN_FRAMES = 1 / FPS;

    cPreloaderTimeout = setTimeout('continueAnimation()', SECONDS_BETWEEN_FRAMES / 1000);

}

function continueAnimation() {

    cXpos += cFrameWidth;
    cIndex += 1;

    if (cIndex >= cTotalFrames) {
        cXpos = 0;
        cIndex = 0;
    }

    if (document.getElementById('preload'))
        document.getElementById('preload').style.backgroundPosition = (-cXpos) + 'px 0';

    cPreloaderTimeout = setTimeout('continueAnimation()', SECONDS_BETWEEN_FRAMES * 1000);
}

function stopAnimation() {
    clearTimeout(cPreloaderTimeout);
    cPreloaderTimeout = false;
}

function imageLoader(s, fun) {
    clearTimeout(cImageTimeout);
    cImageTimeout = 0;
    genImage = new Image();
    genImage.onload = function () { cImageTimeout = setTimeout(fun, 0) };
    genImage.src = s;
}


