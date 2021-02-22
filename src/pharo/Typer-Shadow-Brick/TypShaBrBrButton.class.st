Class {
	#name : #TypShaBrBrButton,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrButton class >> shadowedClass [
	^ BrButton class
]

{ #category : #shadow }
TypShaBrBrButton >> mAction: aLookup [ 
	<typShaMethod: 'action:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBrBrButton >> mIcon: aLookup [
	<typShaMethod: 'icon:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {BlElement typAsType}
		argumentsOptional: false
		signalsAlways: false
]
