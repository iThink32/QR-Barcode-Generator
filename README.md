# QR-Barcode-Generator
QR-Barcode-Generator

This enum returns either a barcode or a qrcode from a string you pass to it

Use it as follows:

```
        let code = CodeType.barcode
        imgView.image = code.image(string: "hello how are you??", imgViewFrame: imgView.frame)
```
