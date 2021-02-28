Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolveBasic: aLookup [
	| pragmas pragma |
	aLookup receiver isNamed
		ifFalse: [ ^ #() ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ #() ].
	pragmas := (aLookup receiver classDescription
		lookupSelector: #initialize)
		ifNil: [ ^ #() ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = aLookup selector ] ]
		ifNone: [ ^ #() ].
	self flag: 'FIXME parameters not covered yet, scopes'.
	^ {(pragma arguments second typAsType
		origin: aLookup asOrigin;
		yourself)}
]
