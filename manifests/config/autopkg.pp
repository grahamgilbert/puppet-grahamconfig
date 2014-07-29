class grahamconfig::config::autopkg (
    ){

    $my_homedir   = $grahamconfig::my_homedir
    $my_sourcedir = $grahamconfig::my_sourcedir
    $my_username  = $grahamconfig::my_username

    mac_admin::osx_defaults { 'AutoPkg Munki Repo':
        user   => $my_username,
        domain => 'com.github.autopkg',
        key    => 'MUNKI_REPO',
        value  => '/Volumes/Munki',
    }

    property_list_key { 'RECIPE_REPOS - Autopkg':
        ensure      =>      present,
        path        =>      "${my_homedir}/Library/Preferences/com.github.autopkg.plist",
        key         =>      'RECIPE_REPOS',
        value       =>      [ {
                                'dicts'  => "${my_homedir}/Library/AutoPkg/RecipeRepos/com.github.autopkg.recipes",
                                'string' => 'https://github.com/autopkg/recipes.git'}],
        value_type  =>      'hash',
    }

    property_list_key { 'RECIPE_REPOS - Arubdesu':
        ensure      =>      present,
        path        =>      "${my_homedir}/Library/Preferences/com.github.autopkg.plist",
        key         =>      'RECIPE_REPOS',
        value       =>      [ {
                                'dicts'  => "${my_homedir}/Library/AutoPkg/RecipeRepos/com.github.arubdesu-recipes",
                                'string' => 'https://github.com/autopkg/arubdesu-recipes'}],
        value_type  =>      'hash',
    }
}