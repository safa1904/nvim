(import-macros {: packadd! : nyoom-module-p! : nyoom-module-ensure!} :macros)

;; conditional modules

(local neorg-modules
       {:core.defaults {}
        :core.norg.manoeuvre {}
        :core.keybinds {:config {:default_keybinds false}}
        :core.norg.dirman {:config {:workspaces {:main "~/neorg"}}}})

;; add conditional modules

(nyoom-module-p! cmp (tset neorg-modules :core.norg.completion
                           {:config {:engine :nvim-cmp}}))

;; add flaged modules

(nyoom-module-p! neorg.+pretty
                 (tset neorg-modules :core.norg.concealer
                       {:config {:icon_preset :varied}}))

(nyoom-module-p! neorg.+present
                 (do
                   (nyoom-module-ensure! zen)
                   (tset neorg-modules :core.presenter
                         {:config {:zen_mode :truezen}})))

(nyoom-module-p! neorg.+export
                 (do
                   (tset neorg-modules :core.export {})
                   (tset neorg-modules :core.export.markdown
                         {:config {:extensions :all}})))

(setup :neorg {:load neorg-modules})
