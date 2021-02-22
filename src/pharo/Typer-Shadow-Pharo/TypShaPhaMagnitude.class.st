Class {
	#name : #TypShaPhaMagnitude,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMagnitude class >> shadowedClass [
	^ Magnitude class
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary223: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary225: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary226: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaMagnitude >> mMax: aLookup [
	<typShaMethod: 'max:'>
	self flag: 'FIXME argumentTypes?'.
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiverType.
			(aLookup argumentTypes at: 1)} typAsType
		arguments: {Magnitude typAsType}
		argumentsOptional: false
		signalsAlways: false
]
