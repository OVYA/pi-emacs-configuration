/**
 * Description courte du module (obligatoire)
 *
 * Description plus longue du module (conseillé)
 */
define([
  "module",
  "dojo/_base/declare",
  "geonef/jig/_Widget",
  "dojo/_base/lang",
  "geonef/button/Action"
], function(module, declare, _Widget, lang, Action) {

return declare([_Widget], { //--noindent--

  /**
   * @override
   */
  "class": _Widget.prototype["class"] + " myWidget",

  /**
   * @override
   */
  makeContentNodes: function() {
    return [
      ["div", {}, "My content"]
    ];
  },

  /**
   * @override
   */
  startup: function() {
    this.inherited(arguments);
  },

  /**
   * The Class name comes from module's -- used by declare()
   */
  declaredClass: module.id

});

});