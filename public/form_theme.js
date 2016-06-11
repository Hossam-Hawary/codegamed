/**
 * Created by hossam on 23/05/16.
 */

angular
    .module('codeGamed').config(function($mdThemingProvider) {
    // Configure a dark theme with primary foreground yellow
    $mdThemingProvider.theme('docs-dark', 'default')
        .primaryPalette('yellow')
        .dark();
});
