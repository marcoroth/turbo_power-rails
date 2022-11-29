function t() {
  const t = JSON.parse(this.templateContent.textContent), {id: e, selector: o, receiver: r, method: n, args: i} = t;
  let s = [ self ];
  return o && (s = Array.from(document.querySelectorAll(o))), r && (s = s.map((t => {
    let e = t;
    const o = r.split(".");
    for (;o.length > 0; ) e = e[o.shift()];
    return e;
  }))), "dispatchEvent" === n ? function(t, e, o = {}) {
    const r = new CustomEvent(e, o);
    t.forEach((t => t.dispatchEvent(r)));
  }(s, i[0], i[1] || {}) : n.endsWith("=") ? s.forEach((t => t[n.slice(0, -1).trim()] = i[0])) : void s.forEach((t => t[n].apply(t, i)));
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

var u = {
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

function l() {}

function d(t) {
  if (t) return t.getAttribute && t.getAttribute("id") || t.id;
}

var f = function(t, e, o) {
  if (o || (o = {}), "string" == typeof e) if ("#document" === t.nodeName || "HTML" === t.nodeName || "BODY" === t.nodeName) {
    var n = e;
    (e = r.createElement("html")).innerHTML = n;
  } else e = s(e);
  var i = o.getNodeKey || d, c = o.onBeforeNodeAdded || l, f = o.onNodeAdded || l, h = o.onBeforeElUpdated || l, m = o.onElUpdated || l, b = o.onBeforeNodeDiscarded || l, g = o.onNodeDiscarded || l, p = o.onBeforeElChildrenUpdated || l, _ = !0 === o.childrenOnly, v = Object.create(null), A = [];
  function E(t) {
    A.push(t);
  }
  function T(t, e) {
    if (1 === t.nodeType) for (var o = t.firstChild; o; ) {
      var r = void 0;
      e && (r = i(o)) ? E(r) : (g(o), o.firstChild && T(o, e)), o = o.nextSibling;
    }
  }
  function w(t, e, o) {
    !1 !== b(t) && (e && e.removeChild(t), g(t), T(t, o));
  }
  function y(t) {
    f(t);
    for (var e = t.firstChild; e; ) {
      var o = e.nextSibling, r = i(e);
      if (r) {
        var n = v[r];
        n && a(e, n) ? (e.parentNode.replaceChild(n, e), C(n, e)) : y(e);
      } else y(e);
      e = o;
    }
  }
  function C(t, e, o) {
    var n = i(e);
    if (n && delete v[n], !o) {
      if (!1 === h(t, e)) return;
      if (function(t, e) {
        var o, r, n, i, s = e.attributes;
        if (11 !== e.nodeType && 11 !== t.nodeType) {
          for (var a = s.length - 1; a >= 0; a--) r = (o = s[a]).name, n = o.namespaceURI, 
          i = o.value, n ? (r = o.localName || r, t.getAttributeNS(n, r) !== i && ("xmlns" === o.prefix && (r = o.name), 
          t.setAttributeNS(n, r, i))) : t.getAttribute(r) !== i && t.setAttribute(r, i);
          for (var c = t.attributes, u = c.length - 1; u >= 0; u--) r = (o = c[u]).name, (n = o.namespaceURI) ? (r = o.localName || r, 
          e.hasAttributeNS(n, r) || t.removeAttributeNS(n, r)) : e.hasAttribute(r) || t.removeAttribute(r);
        }
      }(t, e), m(t), !1 === p(t, e)) return;
    }
    "TEXTAREA" !== t.nodeName ? function(t, e) {
      var o, n, s, l, d, f = e.firstChild, h = t.firstChild;
      t: for (;f; ) {
        for (l = f.nextSibling, o = i(f); h; ) {
          if (s = h.nextSibling, f.isSameNode && f.isSameNode(h)) {
            f = l, h = s;
            continue t;
          }
          n = i(h);
          var m = h.nodeType, b = void 0;
          if (m === f.nodeType && (1 === m ? (o ? o !== n && ((d = v[o]) ? s === d ? b = !1 : (t.insertBefore(d, h), 
          n ? E(n) : w(h, t, !0), h = d) : b = !1) : n && (b = !1), (b = !1 !== b && a(h, f)) && C(h, f)) : 3 !== m && 8 != m || (b = !0, 
          h.nodeValue !== f.nodeValue && (h.nodeValue = f.nodeValue))), b) {
            f = l, h = s;
            continue t;
          }
          n ? E(n) : w(h, t, !0), h = s;
        }
        if (o && (d = v[o]) && a(d, f)) t.appendChild(d), C(d, f); else {
          var g = c(f);
          !1 !== g && (g && (f = g), f.actualize && (f = f.actualize(t.ownerDocument || r)), 
          t.appendChild(f), y(f));
        }
        f = l, h = s;
      }
      !function(t, e, o) {
        for (;e; ) {
          var r = e.nextSibling;
          (o = i(e)) ? E(o) : w(e, t, !0), e = r;
        }
      }(t, h, n);
      var p = u[t.nodeName];
      p && p(t, e);
    }(t, e) : u.TEXTAREA(t, e);
  }
  !function t(e) {
    if (1 === e.nodeType || 11 === e.nodeType) for (var o = e.firstChild; o; ) {
      var r = i(o);
      r && (v[r] = o), t(o), o = o.nextSibling;
    }
  }(t);
  var S, N, x = t, P = x.nodeType, O = e.nodeType;
  if (!_) if (1 === P) 1 === O ? a(t, e) || (g(t), x = function(t, e) {
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
  if (x === e) g(t); else {
    if (e.isSameNode && e.isSameNode(x)) return;
    if (C(x, e, _), A) for (var k = 0, U = A.length; k < U; k++) {
      var L = v[A[k]];
      L && w(L, L.parentNode, !1);
    }
  }
  return !_ && x !== t && t.parentNode && (x.actualize && (x = x.actualize(t.ownerDocument || r)), 
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

function g() {
  var t;
  const e = ((null === (t = this.getAttribute("classes")) || void 0 === t ? void 0 : t.split(" ")) || []).filter((t => t.length > 0));
  e.length > 0 ? this.targetElements.forEach((t => t.classList.remove(...e))) : console.warn('[TurboPower] no "classes" provided for Turbo Streams operation "remove_css_class"');
}

function p() {
  const t = this.getAttribute("attribute"), e = this.getAttribute("value") || "";
  t ? this.targetElements.forEach((o => o.setAttribute(t, e))) : console.warn('[TurboPower] no "attribute" provided for Turbo Streams operation "set_attribute"');
}

function _() {
  const t = this.getAttribute("attribute"), e = this.getAttribute("value") || "";
  t ? this.targetElements.forEach((o => o.dataset[function(t) {
    return t.replace(/(?:[_-])([a-z0-9])/g, ((t, e) => e.toUpperCase()));
  }(t)] = e)) : console.warn('[TurboPower] no "attribute" provided for Turbo Streams operation "set_dataset_attribute"');
}

function v() {
  const t = this.getAttribute("name"), e = this.getAttribute("value") || "";
  t ? this.targetElements.forEach((o => o[t] = e)) : console.error('[TurboPower] no "name" provided for Turbo Streams operation "set_property"');
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
  t.add_css_class = m, t.remove_css_class = g, t.remove_attribute = b, t.set_attribute = p, 
  t.set_dataset_attribute = _, t.set_property = v, t.set_style = A, t.set_styles = E, 
  t.set_value = T;
}

function y() {
  const t = this.getAttribute("url") || "/", e = this.getAttribute("turbo_action") || "advance";
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

function k() {
  window.Turbo.cache.clear();
}

function U(t) {
  t.redirect_to = y, t.reload = C, t.scroll_into_view = S, t.set_cookie = N, t.set_cookie_item = x, 
  t.set_focus = P, t.set_title = O, t.turbo_clear_cache = k;
}

function L() {
  const t = this.getAttribute("parent");
  if (t) {
    const e = document.querySelector(t);
    e ? this.targetElements.forEach((t => e.appendChild(t))) : console.error(`[TurboPower] couldn't find parent element using selector "${t}" for Turbo Streams operation "graft"`);
  } else console.error('[TurboPower] no "parent" selector provided for Turbo Streams operation "graft"');
}

function I() {
  const t = this.templateContent.textContent || "";
  this.targetElements.forEach((e => e.innerHTML = t));
}

function R() {
  const t = this.getAttribute("position") || "beforebegin", e = this.templateContent.textContent || "";
  this.targetElements.forEach((o => o.insertAdjacentHTML(t, e)));
}

function V() {
  const t = this.getAttribute("position") || "beforebegin", e = this.getAttribute("text") || "";
  this.targetElements.forEach((o => o.insertAdjacentText(t, e)));
}

function z() {
  const t = this.templateContent.textContent || "";
  this.targetElements.forEach((e => e.outerHTML = t));
}

function H() {
  const t = this.getAttribute("name"), e = this.getAttribute("content") || "";
  if (t) {
    let o = document.head.querySelector(`meta[name='${t}']`);
    o || (o = document.createElement("meta"), o.name = t, document.head.appendChild(o)), 
    o.content = e;
  } else console.error('[TurboPower] no "name" provided for Turbo Streams operation "set_meta"');
}

function M() {
  const t = this.getAttribute("text") || "";
  this.targetElements.forEach((e => e.textContent = t));
}

function j(t) {
  t.graft = L, t.inner_html = I, t.insert_adjacent_html = R, t.insert_adjacent_text = V, 
  t.outer_html = z, t.text_content = M, t.set_meta = H;
}

function B() {
  const t = this.getAttribute("message"), e = this.getAttribute("level") || "log";
  console[e](t);
}

function D() {
  const t = JSON.parse(this.getAttribute("data") || "[]"), e = JSON.parse(this.getAttribute("columns") || "[]");
  console.table(t, e);
}

function q(t) {
  t.console_log = B, t.console_table = D;
}

function J() {
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

function $(t) {
  t.dispatch_event = J;
}

function F() {
  const t = this.getAttribute("url"), e = this.getAttribute("state"), o = this.getAttribute("title") || "";
  window.history.pushState(e, o, t);
}

function X() {
  const t = this.getAttribute("url"), e = this.getAttribute("state"), o = this.getAttribute("title") || "";
  window.history.replaceState(e, o, t);
}

function G() {
  const t = Number(this.getAttribute("delta")) || 0;
  window.history.go(t);
}

function K(t) {
  t.push_state = F, t.replace_state = X, t.history_go = G;
}

function W(t) {
  return "session" === t ? window.sessionStorage : window.localStorage;
}

function Y() {
  W(this.getAttribute("type")).clear();
}

function Q() {
  const t = this.getAttribute("key"), e = this.getAttribute("value") || "", o = this.getAttribute("type");
  t ? W(o).setItem(t, e) : console.warn('[TurboPower] no "key" provided for Turbo Streams operation "set_storage_item"');
}

function Z() {
  const t = this.getAttribute("key"), e = this.getAttribute("type");
  t ? W(e).removeItem(t) : console.warn('[TurboPower] no "key" provided for Turbo Streams operation "remove_storage_item"');
}

function tt(t) {
  t.clear_storage = Y, t.set_storage_item = Q, t.remove_storage_item = Z;
}

function et() {
  this.targetElements.forEach((t => t.reload()));
}

function ot() {
  const t = this.getAttribute("src");
  this.targetElements.forEach((e => e.src = t));
}

function rt(t) {
  t.turbo_frame_reload = et, t.turbo_frame_set_src = ot;
}

function nt(t) {
  w(t), U(t), q(t), j(t), $(t), K(t), tt(t), rt(t);
}

function it(t) {
  (t => {
    t.morph = h;
  })(t), o.initialize(t), nt(t);
}

function st(t, e, o) {
  o[t] = e;
}

var at = {
  initialize: it,
  register: st,
  Actions: Object.freeze({
    __proto__: null,
    register: nt,
    add_css_class: m,
    remove_attribute: b,
    remove_css_class: g,
    set_attribute: p,
    set_dataset_attribute: _,
    set_property: v,
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
    turbo_clear_cache: k,
    registerBrowserActions: U,
    console_log: B,
    console_table: D,
    registerDebugActions: q,
    graft: L,
    inner_html: I,
    insert_adjacent_html: R,
    insert_adjacent_text: V,
    outer_html: z,
    set_meta: H,
    text_content: M,
    registerDOMActions: j,
    dispatch_event: J,
    registerEventsActions: $,
    push_state: F,
    replace_state: X,
    history_go: G,
    registerHistoryActions: K,
    clear_storage: Y,
    set_storage_item: Q,
    remove_storage_item: Z,
    registerStorageActions: tt,
    turbo_frame_reload: et,
    turbo_frame_set_src: ot,
    registerTurboFrameActions: rt
  })
};

var TurboPower = at;

export { TurboPower as default };
