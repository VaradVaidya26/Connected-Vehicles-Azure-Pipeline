module.exports = async function (context, myBlob) {
    context.log("********Azure Function Started********");

    let result = true;
    let blobContent = myBlob.toString();

    // Log first 500 characters for debugging
    context.log("Blob Content (first 500 chars):", blobContent.substring(0, 500));

    // Remove BOM and extra newlines for safe JSON parsing
    let cleanedContent = blobContent.replace(/^\uFEFF/, '').trim().replace(/\r?\n/g, ' ');

    context.log("Cleaned Content (first 500 chars):", cleanedContent.substring(0, 500));

    try {
        // Attempt to parse JSON
        JSON.parse(cleanedContent);
        context.log("JSON parsed successfully.");
    } catch (jsonException) {
        context.log("JSON Parse Exception:", jsonException);
        result = false;
    }

    try {
        // Assign to correct binding depending on result
        if (result) {
            context.bindings.stagingFolder = cleanedContent;
            context.log("********File Copied to Staging Folder Successfully********");
        } else {
            context.bindings.rejectedFolder = cleanedContent;
            context.log("********Invalid JSON File Copied to Rejected Folder Successfully********");
        }
    } catch (bindingException) {
        context.log("Binding Exception:", bindingException);
    }

    context.log("*******Azure Function Ended*******");
};
