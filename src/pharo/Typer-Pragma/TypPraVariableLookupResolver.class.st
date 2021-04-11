Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription ]
]

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	| pragmas pragma |
	self assert: [ self canResolve: aLookup ].
	aLookup push: self.
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
