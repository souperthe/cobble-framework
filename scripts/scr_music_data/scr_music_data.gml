/// @self obj_music
function scr_music_data()
{
    
    musicLibraryAddEntry(rm_example_1, mu_solidhouse, false)
    musicLibraryAddEntry(rm_test, mu_hub, false)
    musicLibraryAddSecretEntry(rm_test_secret, mu_secret_solidhouse, false)
    
    musicLibraryAddSecretEntry(rm_example_secret_1, mu_secret_solidhouse, false)
    musicLibraryAddSecretEntry(rm_example_secret_2, mu_secret_solidhouse, false)
    musicLibraryAddSecretEntry(rm_example_secret_3, mu_secret_solidhouse, false)

    return
}