Class {
	#name : #TypShaGtGtPharoUnaryMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoUnaryMessageNode class >> shadowedClass [
	^ GtPharoUnaryMessageNode class
]

{ #category : #shadow }
TypShaGtGtPharoUnaryMessageNode >> mParent: aLookup [
	<typShaMethod: 'parent'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoMessageSendNode typAsType
]

{ #category : #shadow }
TypShaGtGtPharoUnaryMessageNode >> mSelectorPart: aLookup [
	<typShaMethod: 'selectorPart'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: SmaCCToken typAsType
]
