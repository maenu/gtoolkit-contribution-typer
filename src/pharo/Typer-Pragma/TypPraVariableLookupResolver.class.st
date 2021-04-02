Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	| pragmas pragma |
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ ^ self unknown ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ self unknown ].
	pragmas := (aLookup receiver classDescription
		lookupSelector: #initialize)
		ifNil: [ ^ self unknown ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = aLookup selector ] ]
		ifNone: [ ^ self unknown ].
	self flag: 'FIXME parameters not covered yet, scopes'.
	^ pragma arguments second typAsType
		addOrigin: aLookup asOrigin;
		yourself
]
