Extension { #name : #Pragma }

{ #category : #'*Typer-Pragma' }
Pragma >> typPraArgumentsInject: aType [

	^ aType withArguments: arguments first typAsTypes
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsArguments [
	^ selector = #typPraArguments:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsMethod [
	^ self typPraIsResult
		or: [ self typPraIsArguments or: [ self typPraIsSignalsAlways ] ]
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsParameters [ 
	^ selector = #typPraParameters:
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsResult [

	^ selector = #typPraResult: or: [ selector = #return: ]
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
	^ self typPraIsParameters or: [ self typPraIsSuperTypeBindTo ]
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraIsVariable: aString [
	^ selector = #typPraVariable:as: and: [ arguments first = aString ]
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraMethodInject: aType [
	self typPraIsResult
		ifTrue: [ ^ self typPraResultInject: aType ].
	self typPraIsArguments
		ifTrue: [ ^ self typPraArgumentsInject: aType ].
	self typPraIsSignalsAlways
		ifTrue: [ ^ self typPraSignalsAlwaysInject: aType ].
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraParametersInject: aType [

	| type |
	type := TypParametricType
		        classDescription: aType classDescription
		        parameters: (arguments first typAsTypes
				         collect: [ :f | f name -> f ]
				         as: OrderedDictionary).
	aType hasSuper ifTrue: [ 
		type := type withSuper: aType super ].
	^ type
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraResultInject: aType [

	^ aType withResult: arguments first typAsType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraSignalsAlwaysInject: aType [

	^ aType withSignalsAlways: arguments first
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraSuperTypeBindToInject: aType [
	^ aType
		withSuper: (aType super withAt: arguments first put: arguments second typAsType)
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraTypeInject: aType [
	self typPraIsParameters
		ifTrue: [ ^ self typPraParametersInject: aType ].
	self typPraIsSuperTypeBindTo
		ifTrue: [ ^ self typPraSuperTypeBindToInject: aType ].
	^ aType
]

{ #category : #'*Typer-Pragma' }
Pragma >> typPraVariable [
	^ arguments second typAsType
]
