import "@hotwired/turbo";

function t() {
  let t = JSON.parse(this.templateContent.textContent), {id: e, selector: o, receiver: r, method: n, args: i} = t, s = [ self ];
  if ("dispatchEvent" === (o && (s = Array.from(document.querySelectorAll(o))), r && (s = s.map((t => {
    let e = t, o = r.split(".");
    for (;o.length > 0; ) e = e[o.shift()];
    return e;
  }))), n)) {
    let t = new CustomEvent(i[0], i[1] || {});
    s.forEach((e => e.dispatchEvent(t)));
  } else s.forEach((t => t[n].apply(t, i)));
}

var e, o = {
  initialize: function(e) {
    e.invoke = t;
  }
}, r = "undefined" == typeof document ? void 0 : document, n = !!r && "content" in r.createElement("template"), i = !!r && r.createRange && "createContextualFragment" in r.createRange();

function s(t) {
  return t = t.trim(), n ? function(t) {
    var e = r.createElement("template");
    return e.innerHTML = t, e.content.childNodes[0];
  }(t) : i ? function(t) {
    return e || (e = r.createRange()).selectNode(r.body), e.createContextualFragment(t).childNodes[0];
  }(t) : function(t) {
    var e = r.createElement("body");
    return e.innerHTML = t, e.childNodes[0];
  }(t);
}

function a(t, e) {
  var o, r, n = t.nodeName, i = e.nodeName;
  return n === i || (o = n.charCodeAt(0), r = i.charCodeAt(0), o <= 90 && r >= 97 ? n === i.toUpperCase() : r <= 90 && o >= 97 && i === n.toUpperCase());
}

function c(t, e, o) {
  t[o] !== e[o] && (t[o] = e[o], t[o] ? t.setAttribute(o, "") : t.removeAttribute(o));
}

var l = {
  OPTION: function(t, e) {
    var o = t.parentNode;
    if (o) {
      var r = o.nodeName.toUpperCase();
      "OPTGROUP" === r && (r = (o = o.parentNode) && o.nodeName.toUpperCase()), "SELECT" !== r || o.hasAttribute("multiple") || (t.hasAttribute("selected") && !e.selected && (t.setAttribute("selected", "selected"), 
      t.removeAttribute("selected")), o.selectedIndex = -1);
    }
    c(t, e, "selected");
  },
  INPUT: function(t, e) {
    c(t, e, "checked"), c(t, e, "disabled"), t.value !== e.value && (t.value = e.value), 
    e.hasAttribute("value") || t.removeAttribute("value");
  },
  TEXTAREA: function(t, e) {
    var o = e.value;
    t.value !== o && (t.value = o);
    var r = t.firstChild;
    if (r) {
      var n = r.nodeValue;
      if (n == o || !o && n == t.placeholder) return;
      r.nodeValue = o;
    }
  },
  SELECT: function(t, e) {
    if (!e.hasAttribute("multiple")) {
      for (var o, r, n = -1, i = 0, s = t.firstChild; s; ) if ("OPTGROUP" === (r = s.nodeName && s.nodeName.toUpperCase())) s = (o = s).firstChild; else {
        if ("OPTION" === r) {
          if (s.hasAttribute("selected")) {
            n = i;
            break;
          }
          i++;
        }
        !(s = s.nextSibling) && o && (s = o.nextSibling, o = null);
      }
      t.selectedIndex = n;
    }
  }
};

function u() {}

function d(t) {
  if (t) return t.getAttribute && t.getAttribute("id") || t.id;
}

var f = function(t, e, o) {
  if (o || (o = {}), "string" == typeof e) if ("#document" === t.nodeName || "HTML" === t.nodeName || "BODY" === t.nodeName) {
    var n = e;
    (e = r.createElement("html")).innerHTML = n;
  } else e = s(e);
  var i = o.getNodeKey || d, c = o.onBeforeNodeAdded || u, f = o.onNodeAdded || u, h = o.onBeforeElUpdated || u, m = o.onElUpdated || u, b = o.onBeforeNodeDiscarded || u, p = o.onNodeDiscarded || u, g = o.onBeforeElChildrenUpdated || u, v = !0 === o.childrenOnly, _ = Object.create(null), A = [];
  function E(t) {
    A.push(t);
  }
  function T(t, e) {
    if (1 === t.nodeType) for (var o = t.firstChild; o; ) {
      var r = void 0;
      e && (r = i(o)) ? E(r) : (p(o), o.firstChild && T(o, e)), o = o.nextSibling;
    }
  }
  function w(t, e, o) {
    !1 !== b(t) && (e && e.removeChild(t), p(t), T(t, o));
  }
  function y(t) {
    f(t);
    for (var e = t.firstChild; e; ) {
      var o = e.nextSibling, r = i(e);
      if (r) {
        var n = _[r];
        n && a(e, n) ? (e.parentNode.replaceChild(n, e), C(n, e)) : y(e);
      } else y(e);
      e = o;
    }
  }
  function C(t, e, o) {
    var n = i(e);
    if (n && delete _[n], !o) {
      if (!1 === h(t, e)) return;
      if (function(t, e) {
        var o, r, n, i, s = e.attributes;
        if (11 !== e.nodeType && 11 !== t.nodeType) {
          for (var a = s.length - 1; a >= 0; a--) r = (o = s[a]).name, n = o.namespaceURI, 
          i = o.value, n ? (r = o.localName || r, t.getAttributeNS(n, r) !== i && ("xmlns" === o.prefix && (r = o.name), 
          t.setAttributeNS(n, r, i))) : t.getAttribute(r) !== i && t.setAttribute(r, i);
          for (var c = t.attributes, l = c.length - 1; l >= 0; l--) r = (o = c[l]).name, (n = o.namespaceURI) ? (r = o.localName || r, 
          e.hasAttributeNS(n, r) || t.removeAttributeNS(n, r)) : e.hasAttribute(r) || t.removeAttribute(r);
        }
      }(t, e), m(t), !1 === g(t, e)) return;
    }
    "TEXTAREA" !== t.nodeName ? function(t, e) {
      var o, n, s, u, d, f = e.firstChild, h = t.firstChild;
      t: for (;f; ) {
        for (u = f.nextSibling, o = i(f); h; ) {
          if (s = h.nextSibling, f.isSameNode && f.isSameNode(h)) {
            f = u, h = s;
            continue t;
          }
          n = i(h);
          var m = h.nodeType, b = void 0;
          if (m === f.nodeType && (1 === m ? (o ? o !== n && ((d = _[o]) ? s === d ? b = !1 : (t.insertBefore(d, h), 
          n ? E(n) : w(h, t, !0), h = d) : b = !1) : n && (b = !1), (b = !1 !== b && a(h, f)) && C(h, f)) : 3 !== m && 8 != m || (b = !0, 
          h.nodeValue !== f.nodeValue && (h.nodeValue = f.nodeValue))), b) {
            f = u, h = s;
            continue t;
          }
          n ? E(n) : w(h, t, !0), h = s;
        }
        if (o && (d = _[o]) && a(d, f)) t.appendChild(d), C(d, f); else {
          var p = c(f);
          !1 !== p && (p && (f = p), f.actualize && (f = f.actualize(t.ownerDocument || r)), 
          t.appendChild(f), y(f));
        }
        f = u, h = s;
      }
      !function(t, e, o) {
        for (;e; ) {
          var r = e.nextSibling;
          (o = i(e)) ? E(o) : w(e, t, !0), e = r;
        }
      }(t, h, n);
      var g = l[t.nodeName];
      g && g(t, e);
    }(t, e) : l.TEXTAREA(t, e);
  }
  !function t(e) {
    if (1 === e.nodeType || 11 === e.nodeType) for (var o = e.firstChild; o; ) {
      var r = i(o);
      r && (_[r] = o), t(o), o = o.nextSibling;
    }
  }(t);
  var S, N, x = t, P = x.nodeType, O = e.nodeType;
  if (!v) if (1 === P) 1 === O ? a(t, e) || (p(t), x = function(t, e) {
    for (var o = t.firstChild; o; ) {
      var r = o.nextSibling;
      e.appendChild(o), o = r;
    }
    return e;
  }(t, (S = e.nodeName, (N = e.namespaceURI) && "http://www.w3.org/1999/xhtml" !== N ? r.createElementNS(N, S) : r.createElement(S)))) : x = e; else if (3 === P || 8 === P) {
    if (O === P) return x.nodeValue !== e.nodeValue && (x.nodeValue = e.nodeValue), 
    x;
    x = e;
  }
  if (x === e) p(t); else {
    if (e.isSameNode && e.isSameNode(x)) return;
    if (C(x, e, v), A) for (var k = 0, U = A.length; k < U; k++) {
      var L = _[A[k]];
      L && w(L, L.parentNode, !1);
    }
  }
  return !v && x !== t && t.parentNode && (x.actualize && (x = x.actualize(t.ownerDocument || r)), 
  t.parentNode.replaceChild(x, t)), x;
};

function h() {
  const t = {
    childrenOnly: this.hasAttribute("children-only")
  };
  this.targetElements.forEach((e => {
    f(e, t.childrenOnly ? this.templateContent : this.templateElement.innerHTML, t);
  }));
}

function m() {
  var t;
  const e = ((null === (t = this.getAttribute("classes")) || void 0 === t ? void 0 : t.split(" ")) || []).filter((t => t.length > 0));
  e.length > 0 ? this.targetElements.forEach((t => t.classList.add(...e))) : console.warn('[TurboPower] no "classes" provided for Turbo Streams operation "add_css_class"');
}

function b() {
  const t = this.getAttribute("attribute");
  t ? this.targetElements.forEach((e => e.removeAttribute(t))) : console.warn('[TurboPower] no "attribute" provided for Turbo Streams operation "remove_attribute"');
}

function p() {
  var t;
  const e = ((null === (t = this.getAttribute("classes")) || void 0 === t ? void 0 : t.split(" ")) || []).filter((t => t.length > 0));
  e.length > 0 ? this.targetElements.forEach((t => t.classList.remove(...e))) : console.warn('[TurboPower] no "classes" provided for Turbo Streams operation "remove_css_class"');
}

function g() {
  const t = this.getAttribute("attribute"), e = this.getAttribute("value") || "";
  t ? this.targetElements.forEach((o => o.setAttribute(t, e))) : console.warn('[TurboPower] no "attribute" provided for Turbo Streams operation "set_attribute"');
}

function v() {
  const t = this.getAttribute("attribute"), e = this.getAttribute("value") || "";
  t ? this.targetElements.forEach((o => o.dataset[function(t) {
    return t.replace(/(?:[_-])([a-z0-9])/g, ((t, e) => e.toUpperCase()));
  }(t)] = e)) : console.warn('[TurboPower] no "attribute" provided for Turbo Streams operation "set_dataset_attribute"');
}

function _() {
  const t = this.getAttribute("name");
  t ? this.targetElements.forEach((e => e[t] = value)) : console.error('[TurboPower] no "name" provided for Turbo Streams operation "set_property"');
}

function A() {
  const t = this.getAttribute("name"), e = this.getAttribute("value") || "";
  t ? this.targetElements.forEach((o => o.style[t] = e)) : console.error('[TurboPower] no "name" provided for Turbo Streams operation "set_style"');
}

function E() {
  const t = this.getAttribute("styles") || "";
  this.targetElements.forEach((e => e.setAttribute("style", t)));
}

function T() {
  const t = this.getAttribute("value") || "";
  this.targetElements.forEach((e => e.value = t));
}

function w(t) {
  t.add_css_class = m, t.remove_css_class = p, t.remove_attribute = b, t.set_attribute = g, 
  t.set_dataset_attribute = v, t.set_property = _, t.set_style = A, t.set_styles = E, 
  t.set_value = T;
}

function y() {
  const t = this.getAttribute("url") || "/", e = this.getAttribute("action") || "advance";
  "true" === this.getAttribute("turbo") ? (window.Turbo && window.Turbo.visit(t, {
    action: e
  }), window.Turbolinks && window.Turbolinks.visit(t, {
    action: e
  }), window.Turbo || window.Turbolinks || (window.location.href = t)) : window.location.href = t;
}

function C() {
  window.location.reload();
}

function S() {
  this.targetElements.forEach((t => t.scrollIntoView()));
}

function N() {
  const t = this.getAttribute("cookie") || "";
  document.cookie = t;
}

function x() {
  console.log("set_cookie_item", this);
}

function P() {
  this.targetElements.forEach((t => t.focus()));
}

function O() {
  const t = this.getAttribute("title") || "";
  let e = document.head.querySelector("title");
  e || (e = document.createElement("title"), document.head.appendChild(e)), e.textContent = t;
}

function k(t) {
  t.redirect_to = y, t.reload = C, t.scroll_into_view = S, t.set_cookie = N, t.set_cookie_item = x, 
  t.set_focus = P, t.set_title = O;
}

function U() {
  const t = this.getAttribute("parent");
  if (t) {
    const e = document.querySelector(t);
    e ? this.targetElements.forEach((t => e.appendChild(t))) : console.error(`[TurboPower] couldn't find parent element using selector "${t}" for Turbo Streams operation "graft"`);
  } else console.error('[TurboPower] no "parent" selector provided for Turbo Streams operation "graft"');
}

function L() {
  const t = this.templateContent.textContent || "";
  this.targetElements.forEach((e => e.innerHTML = t));
}

function I() {
  const t = this.getAttribute("position") || "beforebegin", e = this.templateContent.textContent || "";
  this.targetElements.forEach((o => o.insertAdjacentHTML(t, e)));
}

function R() {
  const t = this.getAttribute("position") || "beforebegin", e = this.getAttribute("text") || "";
  this.targetElements.forEach((o => o.insertAdjacentText(t, e)));
}

function V() {
  const t = this.templateContent.textContent || "";
  this.targetElements.forEach((e => e.outerHTML = t));
}

function z() {
  const t = this.getAttribute("name"), e = this.getAttribute("content") || "";
  if (t) {
    let o = document.head.querySelector(`meta[name='${t}']`);
    o || (o = document.createElement("meta"), o.name = t, document.head.appendChild(o)), 
    o.content = e;
  } else console.error('[TurboPower] no "name" provided for Turbo Streams operation "set_meta"');
}

function H() {
  const t = this.getAttribute("text") || "";
  this.targetElements.forEach((e => e.textContent = t));
}

function M(t) {
  t.graft = U, t.inner_html = L, t.insert_adjacent_html = I, t.insert_adjacent_text = R, 
  t.outer_html = V, t.text_content = H, t.set_meta = z;
}

function j() {
  const t = this.getAttribute("message"), e = this.getAttribute("level") || "log";
  console[e](t);
}

function B() {
  const t = JSON.parse(this.getAttribute("data") || "[]"), e = JSON.parse(this.getAttribute("columns") || "[]");
  console.table(t, e);
}

function D(t) {
  t.console_log = j, t.console_table = B;
}

function q() {
  const t = this.getAttribute("name");
  let e = null;
  try {
    e = this.templateContent.textContent;
  } catch (t) {}
  try {
    const o = e ? JSON.parse(e) : {};
    if (t) {
      const e = new CustomEvent(t, {
        bubbles: !0,
        cancelable: !0,
        detail: o
      });
      this.targetElements.forEach((t => t.dispatchEvent(e)));
    } else console.warn('[TurboPower] no "name" provided for Turbo Streams operation "dispatch_event"');
  } catch (t) {
    console.error(`[TurboPower] error proccessing provided "detail" in "<template>" ("${e}") for Turbo Streams operation "dispatch_event". Error: "${t.message}"`);
  }
}

function J(t) {
  t.dispatch_event = q;
}

function $() {
  const t = this.getAttribute("url"), e = this.getAttribute("state"), o = this.getAttribute("title") || "";
  window.history.pushState(e, o, t);
}

function X() {
  const t = this.getAttribute("url"), e = this.getAttribute("state"), o = this.getAttribute("title") || "";
  window.history.replaceState(e, o, t);
}

function F() {
  const t = Number(this.getAttribute("delta")) || 0;
  window.history.go(t);
}

function G(t) {
  t.push_state = $, t.replace_state = X, t.history_go = F;
}

function K(t) {
  return "session" === t ? window.sessionStorage : window.localStorage;
}

function Y() {
  K(this.getAttribute("type")).clear();
}

function Q() {
  const t = this.getAttribute("key"), e = this.getAttribute("value") || "", o = this.getAttribute("type");
  t ? K(o).setItem(t, e) : console.warn('[TurboPower] no "key" provided for Turbo Streams operation "set_storage_item"');
}

function W() {
  const t = this.getAttribute("key"), e = this.getAttribute("type");
  t ? K(e).removeItem(t) : console.warn('[TurboPower] no "key" provided for Turbo Streams operation "remove_storage_item"');
}

function Z(t) {
  t.clear_storage = Y, t.set_storage_item = Q, t.remove_storage_item = W;
}

function tt(t) {
  w(t), k(t), D(t), M(t), J(t), G(t), Z(t);
}

function et(t) {
  t.morph = h, o.initialize(t), tt(t);
}

function ot(t, e, o) {
  o[t] = e;
}

var rt = {
  initialize: et,
  register: ot,
  Actions: Object.freeze({
    __proto__: null,
    register: tt,
    add_css_class: m,
    remove_attribute: b,
    remove_css_class: p,
    set_attribute: g,
    set_dataset_attribute: v,
    set_property: _,
    set_style: A,
    set_styles: E,
    set_value: T,
    registerAttributesActions: w,
    redirect_to: y,
    reload: C,
    scroll_into_view: S,
    set_cookie: N,
    set_cookie_item: x,
    set_focus: P,
    set_title: O,
    registerBrowserActions: k,
    console_log: j,
    console_table: B,
    registerDebugActions: D,
    graft: U,
    inner_html: L,
    insert_adjacent_html: I,
    insert_adjacent_text: R,
    outer_html: V,
    set_meta: z,
    text_content: H,
    registerDOMActions: M,
    dispatch_event: q,
    registerEventsActions: J,
    push_state: $,
    replace_state: X,
    history_go: F,
    registerHistoryActions: G,
    clear_storage: Y,
    set_storage_item: Q,
    remove_storage_item: W,
    registerStorageActions: Z
  })
};

var TurboPower = rt;

export { TurboPower as default };