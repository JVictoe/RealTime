var background =
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/background.ts");
/******/ })
/************************************************************************/
/******/ ({

/***/ "../../packages/office-online-ccp/lib/copyPasteService.js":
/*!**********************************************************************************!*\
  !*** D:/Git/office-online-ui/packages/office-online-ccp/lib/copyPasteService.js ***!
  \**********************************************************************************/
/*! exports provided: CopyPasteService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "CopyPasteService", function() { return CopyPasteService; });
/* harmony import */ var _getClipboardDataReturnValue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./getClipboardDataReturnValue */ "../../packages/office-online-ccp/lib/getClipboardDataReturnValue.js");

class CopyPasteService {
    constructor(logger, imageReader, window) {
        this.availableCommands = [
            CopyPasteService.testCommand,
            CopyPasteService.pasteCommand,
            CopyPasteService.getClipboardDataCommand,
            CopyPasteService.getAvailableCommandsCommand
        ];
        // Event listener to get image files from paste event object.
        this.onPasteEventImage = (event) => {
            this.imageBlobs = [];
            if (event.clipboardData === null) {
                return;
            }
            const items = event.clipboardData.items;
            for (let i = 0; i < items.length; i += 1) {
                if (this.imageReader.isImageFile(items[i])) {
                    const file = this.imageReader.getAsFile(items[i]);
                    if (file != null)
                        this.imageBlobs.push(file);
                }
            }
        };
        // Try to get image blobs, HTML, and plain text from event.
        // HTML and plain text are set on this.clipboardData immediately.
        // Image is set on this.clipboardData by this.imageReader.
        this.getClipboardData = (event) => {
            if (event.clipboardData === null)
                return;
            this.onPasteEventImage(event);
            if (event.clipboardData.types.indexOf('text/html') !== -1) {
                this.clipboardData.html = event.clipboardData.getData('text/html');
            }
            if (event.clipboardData.types.indexOf('text/plain') !== -1) {
                this.clipboardData.text = event.clipboardData.getData('text/plain');
            }
        };
        // Event listener to get image, plain text, or HTML from paste event object.
        this.onPasteEventGetClipboardData = (event) => {
            this.getClipboardData(event);
            // Stop browser from modifying DOM
            event.preventDefault();
        };
        this.logger = logger;
        this.imageReader = imageReader;
        this.window = window;
        this.imageBlobs = [];
        this.clipboardData = new _getClipboardDataReturnValue__WEBPACK_IMPORTED_MODULE_0__["GetClipboardDataReturnValue"]();
    }
    isTrustedSender(sender) {
        var _a;
        try {
            if (sender === null || sender.url === undefined)
                return false;
            const senderUrl = new URL(sender.url);
            if (senderUrl.origin === null)
                return false;
            const domainMatch = senderUrl.origin.match(/^https:\/\/((.*?(word-edit|powerpoint|onenote|excel|visio)\.(officeapps\.live\.com|partner\.officewebapps\.cn|gov\.online\.office365\.us|dod\.online\.office365\.us))|(project\.microsoft\.com))$/g);
            if (domainMatch === null) {
                (_a = this.logger) === null || _a === void 0 ? void 0 : _a.trackEvent('copypaste_untrusted', { sender: sender.url });
                return false;
            }
            return true;
        }
        catch (e) {
            return false;
        }
    }
    // Inform caller what functions can be called
    handleGetAvailableCommands(_message, sender, sendResponse) {
        var _a;
        if (!this.isTrustedSender(sender)) {
            return false;
        }
        try {
            sendResponse(this.availableCommands);
        }
        catch (e) {
            (_a = this.logger) === null || _a === void 0 ? void 0 : _a.error(`handleGetAvailableCommands() - Exception: ${e.toString()}`);
        }
        return false;
    }
    // Respond to clients so they know of our existence.
    handleTestCommand(message, sender, sendResponse) {
        var _a, _b;
        if (!this.isTrustedSender(sender)) {
            return false;
        }
        try {
            sendResponse(message.object);
        }
        catch (e) {
            (_a = this.logger) === null || _a === void 0 ? void 0 : _a.error(`handleTestCommand() - Exception: ${e.toString()}`);
        }
        (_b = this.logger) === null || _b === void 0 ? void 0 : _b.trackEvent('CopyPaste_Test');
        return false;
    }
    // Copy client's data into system clipboard.
    handleCopyCommand(_message, sender, _sendResponse) {
        var _a;
        if (!this.isTrustedSender(sender)) {
            return false;
        }
        (_a = this.logger) === null || _a === void 0 ? void 0 : _a.trackEvent('CopyPaste_Copy', { deprecated: true });
        return false;
    }
    // Fetch data from system clipboard and return to client.
    handlePasteCommand(_message, sender, sendResponse) {
        var _a, _b;
        if (!this.isTrustedSender(sender)) {
            return false;
        }
        let retVal = false;
        let sandbox = null;
        try {
            sandbox = this.getCopyPasteSandbox();
            // Setting innerHTML to empty string is safe
            // tslint:disable-next-line:no-inner-html
            sandbox.innerHTML = '';
            sandbox.focus();
            document.execCommand('selectAll');
            this.window.addEventListener('paste', this.onPasteEventImage);
            if (document.execCommand('paste')) {
                // First try to fetch image data from browser, then try send back the original image src
                if (this.imageBlobs.length > 0) {
                    this.imageReader.readImages(this.imageBlobs, function (imageHtml) {
                        sendResponse(imageHtml);
                    });
                    retVal = true;
                }
                else {
                    // This also handles the empty situation:
                    //    1. Copy an image from Windows Photo Viewer (or similar software);
                    //    2. Then paste in PPT online doc using context menu;
                    //    3. Browser won't paste anything into sandbox.
                    sendResponse(sandbox.innerHTML);
                }
            }
        }
        catch (e) {
            (_a = this.logger) === null || _a === void 0 ? void 0 : _a.error(`handlePasteCommand() - Exception: ${e.toString()}`);
        }
        if (sandbox !== null) {
            // Setting innerHTML to empty string is safe
            // tslint:disable-next-line:no-inner-html
            sandbox.innerHTML = '';
        }
        this.window.removeEventListener('paste', this.onPasteEventImage);
        (_b = this.logger) === null || _b === void 0 ? void 0 : _b.trackEvent('CopyPaste_Paste', { IsPrefetchedImage: retVal });
        return retVal;
    }
    // Fetch data from system clipboard without modifying DOM
    handleGetClipboardDataCommand(_message, sender, sendResponse) {
        var _a;
        if (!this.isTrustedSender(sender)) {
            return false;
        }
        // Indicates if sendResponse will be called asynchronously
        let retVal = false;
        let sandbox = null;
        try {
            sandbox = this.getCopyPasteSandbox();
            sandbox.focus();
            this.clipboardData = new _getClipboardDataReturnValue__WEBPACK_IMPORTED_MODULE_0__["GetClipboardDataReturnValue"]();
            this.window.addEventListener('paste', this.onPasteEventGetClipboardData);
            if (document.execCommand('paste')) {
                // First try to fetch image data from browser, then try send back the original image src
                if (this.imageBlobs.length > 0) {
                    this.imageReader.readImages(this.imageBlobs, imageHtml => {
                        this.clipboardData.img = imageHtml;
                        sendResponse(this.clipboardData);
                    });
                    retVal = true;
                }
                else {
                    sendResponse(this.clipboardData);
                }
            }
        }
        catch (e) {
            (_a = this.logger) === null || _a === void 0 ? void 0 : _a.error(`handleGetClipboardDataCommand() - Exception: ${e.toString()}`);
        }
        this.window.removeEventListener('paste', this.onPasteEventGetClipboardData);
        return retVal;
    }
    getCopyPasteSandbox() {
        let sandbox = document.getElementById('copyPasteSandbox');
        if (!sandbox) {
            const elem = document.createElement('div');
            elem.contentEditable = true;
            sandbox = document.body.appendChild(elem);
        }
        return sandbox;
    }
}
CopyPasteService.testCommand = 'test';
CopyPasteService.pasteCommand = 'paste';
CopyPasteService.getClipboardDataCommand = 'getClipboardData';
CopyPasteService.getAvailableCommandsCommand = 'getAvailableCommands';
//# sourceMappingURL=copyPasteService.js.map

/***/ }),

/***/ "../../packages/office-online-ccp/lib/fileReaderEx.js":
/*!******************************************************************************!*\
  !*** D:/Git/office-online-ui/packages/office-online-ccp/lib/fileReaderEx.js ***!
  \******************************************************************************/
/*! exports provided: FileReaderEx */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "FileReaderEx", function() { return FileReaderEx; });
class FileReaderEx {
    constructor() {
        this.onloadend = null;
        this.onerror = null;
        this.onabort = null;
        this.reader = undefined;
        // delegates file read events to client provided handler.
        this.onloadendInternal = (event) => {
            if (this.onloadend !== null)
                this.onloadend(event);
        };
        this.onabortInternal = (event) => {
            if (this.onabort !== null)
                this.onabort(event);
        };
        this.onerrorInternal = (event) => {
            if (this.onerror !== null)
                this.onerror(event);
        };
    }
    readAsDataURL(blob) {
        if (this.reader === undefined) {
            this.reader = new FileReader();
            this.reader.onloadend = this.onloadendInternal;
            this.reader.onabort = this.onabortInternal;
            this.reader.onerror = this.onerrorInternal;
        }
        if (this.reader !== undefined)
            this.reader.readAsDataURL(blob);
    }
    isBlob(obj) {
        return obj && obj instanceof Blob;
    }
}
//# sourceMappingURL=fileReaderEx.js.map

/***/ }),

/***/ "../../packages/office-online-ccp/lib/getClipboardDataReturnValue.js":
/*!*********************************************************************************************!*\
  !*** D:/Git/office-online-ui/packages/office-online-ccp/lib/getClipboardDataReturnValue.js ***!
  \*********************************************************************************************/
/*! exports provided: GetClipboardDataReturnValue */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "GetClipboardDataReturnValue", function() { return GetClipboardDataReturnValue; });
class GetClipboardDataReturnValue {
    constructor() {
        this.img = '';
        this.html = '';
        this.text = '';
    }
}
//# sourceMappingURL=getClipboardDataReturnValue.js.map

/***/ }),

/***/ "../../packages/office-online-ccp/lib/imageReader.js":
/*!*****************************************************************************!*\
  !*** D:/Git/office-online-ui/packages/office-online-ccp/lib/imageReader.js ***!
  \*****************************************************************************/
/*! exports provided: ImageReader */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ImageReader", function() { return ImageReader; });
class ImageReader {
    constructor(logger, FileReaderEx) {
        this.fileReaderHandlersDefined = false;
        this.onLoadEnd = (event) => {
            if (event.target !== null && event.target.result !== null) {
                this.imageHtml += '<img src="' + event.target.result + '">';
            }
            this.readImage();
        };
        // when error happens, we try to read remaining available blobs if possible
        this.onAbort = (_event) => {
            var _a;
            (_a = this.logger) === null || _a === void 0 ? void 0 : _a.error('imageReader::onAbort() - readAsDataURL was aborted.');
            this.readImage();
        };
        this.onError = (_event) => {
            var _a;
            (_a = this.logger) === null || _a === void 0 ? void 0 : _a.error('imageReader::onError() - error happens in readAsDataURL()');
            this.readImage();
        };
        this.logger = logger;
        this.FileReaderEx = FileReaderEx;
        this.imageBlobs = [];
        this.imageHtmlCallback = _imageHtml => { };
        this.imageHtml = '';
    }
    // client's responsibility to ensure parameter validity
    isImageFile(item) {
        return item.kind === 'file' && item.type.indexOf('image/') !== -1;
    }
    getAsFile(item) {
        return item.getAsFile();
    }
    readImages(blobs, callback) {
        this.imageBlobs = blobs;
        this.imageHtmlCallback = callback;
        this.imageHtml = '';
        if (!this.fileReaderHandlersDefined) {
            this.FileReaderEx.onloadend = this.onLoadEnd;
            this.FileReaderEx.onabort = this.onAbort;
            this.FileReaderEx.onerror = this.onError;
            this.fileReaderHandlersDefined = true;
        }
        this.readImage();
    }
    readImage() {
        if (this.imageBlobs.length === 0) {
            this.imageHtmlCallback(this.imageHtml);
        }
        else {
            const imageBlob = this.imageBlobs.shift();
            if (!this.FileReaderEx.isBlob(imageBlob)) {
                this.readImage();
                return;
            }
            this.FileReaderEx.readAsDataURL(imageBlob);
        }
    }
}
//# sourceMappingURL=imageReader.js.map

/***/ }),

/***/ "../../packages/office-online-ccp/lib/index.js":
/*!***********************************************************************!*\
  !*** D:/Git/office-online-ui/packages/office-online-ccp/lib/index.js ***!
  \***********************************************************************/
/*! exports provided: CopyPasteService, FileReaderEx, ImageReader */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _copyPasteService__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./copyPasteService */ "../../packages/office-online-ccp/lib/copyPasteService.js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "CopyPasteService", function() { return _copyPasteService__WEBPACK_IMPORTED_MODULE_0__["CopyPasteService"]; });

/* harmony import */ var _fileReaderEx__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./fileReaderEx */ "../../packages/office-online-ccp/lib/fileReaderEx.js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "FileReaderEx", function() { return _fileReaderEx__WEBPACK_IMPORTED_MODULE_1__["FileReaderEx"]; });

/* harmony import */ var _imageReader__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./imageReader */ "../../packages/office-online-ccp/lib/imageReader.js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "ImageReader", function() { return _imageReader__WEBPACK_IMPORTED_MODULE_2__["ImageReader"]; });




//# sourceMappingURL=index.js.map

/***/ }),

/***/ "./src/CopyPasteMessageListener.ts":
/*!*****************************************!*\
  !*** ./src/CopyPasteMessageListener.ts ***!
  \*****************************************/
/*! exports provided: CopyPasteMessageListener */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "CopyPasteMessageListener", function() { return CopyPasteMessageListener; });
/* harmony import */ var _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @ms/office-online-ccp */ "../../packages/office-online-ccp/lib/index.js");

var CopyPasteMessageListener = /** @class */ (function () {
    function CopyPasteMessageListener(copyPasteService) {
        this.copyPasteService = copyPasteService;
        this.onMessageExternal = this.onMessageExternal.bind(this);
    }
    /* Event listener to response external message from Office Online.
     * Returns a boolean indicating if sendResponse becomes invalid after this event listener returns
     * (i.e. if sendResponse will be called asynchronously)
     */
    CopyPasteMessageListener.prototype.onMessageExternal = function (message, sender, sendResponse) {
        switch (message.command) {
            case _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["CopyPasteService"].testCommand:
                return this.copyPasteService.handleTestCommand(message, sender, sendResponse);
            case _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["CopyPasteService"].pasteCommand:
                return this.copyPasteService.handlePasteCommand(message, sender, sendResponse);
            case _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["CopyPasteService"].getClipboardDataCommand:
                return this.copyPasteService.handleGetClipboardDataCommand(message, sender, sendResponse);
            case _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["CopyPasteService"].getAvailableCommandsCommand:
                return this.copyPasteService.handleGetAvailableCommands(message, sender, sendResponse);
            default:
                return false;
        }
    };
    return CopyPasteMessageListener;
}());



/***/ }),

/***/ "./src/background.ts":
/*!***************************!*\
  !*** ./src/background.ts ***!
  \***************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @ms/office-online-ccp */ "../../packages/office-online-ccp/lib/index.js");
/* harmony import */ var _CopyPasteMessageListener__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./CopyPasteMessageListener */ "./src/CopyPasteMessageListener.ts");


var fileReader = new _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["FileReaderEx"]();
var imageReader = new _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["ImageReader"](null /* logger */, fileReader);
var copyPasteService = new _ms_office_online_ccp__WEBPACK_IMPORTED_MODULE_0__["CopyPasteService"](null /* logger */, imageReader, window);
var copyPasteMessageListener = new _CopyPasteMessageListener__WEBPACK_IMPORTED_MODULE_1__["CopyPasteMessageListener"](copyPasteService);
chrome.runtime.onMessageExternal.addListener(copyPasteMessageListener.onMessageExternal);


/***/ })

/******/ });
//# sourceMappingURL=background.js.map