Class {
	#name : #TypPraVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Pragma-Lookup'
}

{ #category : #accessing }
TypPraVariableLookupResult >> type [
	| root pragmas pragma |
	root := lookup root.
	pragmas := (root receiverType classDescription
		lookupSelector: #initialize)
		ifNil: [ TypNoTypeError signal ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = root selector ] ]
		ifNone: [ TypNoTypeError signal ].
	^ pragma arguments second typAsType resolveIn: root receiverType
]
