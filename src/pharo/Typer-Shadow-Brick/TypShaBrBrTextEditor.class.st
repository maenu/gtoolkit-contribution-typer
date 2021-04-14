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
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mText: aLookup [
	<typShaMethod: 'text'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlText typAsType
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mUpdateTo: aLookup [
	<typShaMethod: 'update:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Integer typAsType}
]
