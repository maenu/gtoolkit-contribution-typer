Extension { #name : #Pragma }

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsSuperTypeBindTo [
	^ selector = #typPraSuperTypeBind:to:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsType [
	^ self typPraIsTypeParameters or: [ self typPraIsSuperTypeBindTo ]
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsTypeParameters [
	^ selector = #typPraTypeParameters:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraSuperTypeBindToInject: aType [
	aType superType at: arguments first put: arguments second typAsType.
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraTypeInject: aType [
	self typPraIsTypeParameters
		ifTrue: [ ^ self typPraTypeParametersInject: aType ].
	self typPraIsSuperTypeBindTo
		ifTrue: [ ^ self typPraSuperTypeBindToInject: aType ].
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraTypeParametersInject: aType [
	| type |
	type := TypParametricType
		classDescription: aType classDescription
		parameters:
			(arguments first typAsTypes
				collect: [ :f | f name -> f ]
				as: OrderedDictionary).
	aType hasSuperType
		ifTrue: [ type superType: aType superType ].
	^ type
]
