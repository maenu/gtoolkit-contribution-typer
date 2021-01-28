Class {
	#name : #TypPraVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraVariableLookupResult >> type [
	| pragmas pragma |
	pragmas := (originalLookup receiverType classDescription
		lookupSelector: #initialize)
		ifNil: [ TypNoTypeError signal ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = originalLookup selector ] ]
		ifNone: [ TypNoTypeError signal ].
	^ pragma arguments second typAsType
		resolveIn: resolvedLookup receiverType
]
