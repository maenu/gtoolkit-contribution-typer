Class {
	#name : #TypPraTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraTypeLookupResolver >> resolveBasic: aLookup [
	| classDescription pragmas parameters bindings superTypeBindings |
	classDescription := aLookup classDescription.
	pragmas := (classDescription lookupSelector: #initialize)
		ifNil: [ ^ #() ]
		ifNotNil: #pragmas.
	parameters := pragmas
		detect: [ :e | e selector = #typParameters: ]
		ifFound: [ :e | e arguments first typAsTypes ]
		ifNone: [ #() ].
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
		ifTrue: [ ^ #() ].
	(parameters isEmpty
		and: [ bindings isEmpty and: [ superTypeBindings isNotEmpty ] ])
		ifTrue: [ | type |
			type := classDescription typAsNamedType.
			type origin: aLookup asOrigin.
			type superType: type superType copy.
			superTypeBindings
				keysAndValuesDo: [ :k :v | type superType at: k put: v ].
			^ type ].
	superTypeBindings isEmpty
		ifFalse: [ | type |
			type := classDescription
				typAsParametricTypeWithParameters: bindings.
			type origin: aLookup asOrigin.
			type superType: type superType copy.
			superTypeBindings
				keysAndValuesDo: [ :k :v | type superType at: k put: v ].
			^ type ].
	^ {((classDescription typAsParametricTypeWithParameters: bindings)
		origin: aLookup asOrigin;
		yourself)}
]
