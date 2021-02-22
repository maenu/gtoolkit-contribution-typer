Class {
	#name : #TypShaBrBrTextEditor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditor class >> shadowedClass [
	^ BrTextEditor class
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mInvalidateTo: aLookup [
	<typShaMethod: 'invalidate:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mText: aLookup [
	<typShaMethod: 'text'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlText typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mUpdateTo: aLookup [
	<typShaMethod: 'update:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]
