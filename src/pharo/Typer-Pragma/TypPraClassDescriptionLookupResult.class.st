Class {
	#name : #TypPraClassDescriptionLookupResult,
	#superclass : #TypClassDescriptionLookupResult,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraClassDescriptionLookupResult >> type [
	| classDescription pragmas parameters bindings superTypeBindings |
	classDescription := lookup classDescription.
	pragmas := (classDescription lookupSelector: #initialize)
		ifNil: [ TypNoTypeError signal ]
		ifNotNil: #pragmas.
	parameters := pragmas
		detect: [ :e | e selector = #typParameters: ]
		ifFound: [ :e | e arguments first typAsTypes ]
		ifNone: [ {} ].
	bindings := (parameters asSet collect: [ :e | e name -> e ])
		asDictionary.
	(pragmas select: [ :e | e selector = #typBind:to: ])
		do:
			[ :e | bindings at: e arguments first put: e arguments second typAsType ].
	superTypeBindings := ((pragmas
		select: [ :e | e selector = #typBindSuper:to: ])
		collect: [ :e | e arguments first -> e arguments second typAsType ])
		asDictionary.
	(parameters isEmpty
		and: [ bindings isEmpty and: [ superTypeBindings isEmpty ] ])
		ifTrue: [ TypNoTypeError signal ].
	(parameters isEmpty
		and: [ bindings isEmpty and: [ superTypeBindings isNotEmpty ] ])
		ifTrue: [ ^ classDescription
				typAsNamedTypeWithSuperTypeBindings: superTypeBindings ].
	^ superTypeBindings isEmpty
		ifTrue: [ classDescription
				typAsParametricTypeWithParameters: parameters
				bindings: bindings ]
		ifFalse: [ classDescription
				typAsParametricTypeWithParameters: parameters
				bindings: bindings
				superTypeBindings: superTypeBindings ]
]
