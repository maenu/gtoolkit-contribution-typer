Extension { #name : #Pragma }

{ #category : #'*Typer-Pragma' }
Pragma >> typPraArgumentPutInject: aType [
	aType
		at: '@' , arguments first asString
		put: arguments second typAsType.
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsArgumentPut [
	^ selector = #typPraArgument:put:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsMethod [
	^ self typPraIsResult
		or: [ self typPraIsArgumentPut or: [ self typPraIsSignalsAlways ] ]
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsParameter [ 
	^ selector = #typPraParameter:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsResult [
	^ selector = #typPraResult:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsSignalsAlways [
	^ selector = #typPraSignalsAlways:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsSuperTypeBindTo [
	^ selector = #typPraSuperTypeBind:to:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsType [
	^ self typPraIsParameter or: [ self typPraIsSuperTypeBindTo ]
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraMethodInject: aType [
	self typPraIsResult
		ifTrue: [ ^ self typPraResultInject: aType ].
	self typPraIsArgumentPut
		ifTrue: [ ^ self typPraArgumentPutInject: aType ].
	self typPraIsSignalsAlways
		ifTrue: [ ^ self typPraSignalsAlwaysInject: aType ].
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraParametersInject: aType [
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

{ #category : #'*Typer-Pragma' }
Pragma >> typPraResultInject: aType [
	aType at: '@0' put: arguments first typAsType.
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraSignalsAlwaysInject: aType [
	aType signalsAlways: arguments first.
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraSuperTypeBindToInject: aType [
	aType superType at: arguments first put: arguments second typAsType.
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraTypeInject: aType [
	self typPraIsParameter
		ifTrue: [ ^ self typPraParametersInject: aType ].
	self typPraIsSuperTypeBindTo
		ifTrue: [ ^ self typPraSuperTypeBindToInject: aType ].
	^ aType
]
