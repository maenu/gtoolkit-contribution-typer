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
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaBrBrButton >> mIcon: aLookup [
	<typShaMethod: 'icon:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlElement typAsType}
]
