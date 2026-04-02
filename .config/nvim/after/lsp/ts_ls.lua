return {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    root_markers = { "tsconfig.json", "package.json", "jsconfig.json" },
    single_file_support = false,
}
