Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	| pragmas pragma |
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiver hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	pragmas := (aLookup receiver classDescription
		lookupSelector: #initialize)
		ifNil: [ TypNoTypeError signal ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = aLookup selector ] ]
		ifNone: [ TypNoTypeError signal ].
	^ {(aLookup receiver at: pragma arguments second)}
]
