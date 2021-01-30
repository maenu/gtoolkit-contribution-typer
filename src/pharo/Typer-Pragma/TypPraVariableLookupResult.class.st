Class {
	#name : #TypPraVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraVariableLookupResult >> type [
	| pragmas pragma |
	pragmas := (lookup receiverType classDescription
		lookupSelector: #initialize)
		ifNil: [ TypNoTypeError signal ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = lookup selector ] ]
		ifNone: [ TypNoTypeError signal ].
	^ pragma arguments second typAsType resolveIn: lookup receiverType
]
