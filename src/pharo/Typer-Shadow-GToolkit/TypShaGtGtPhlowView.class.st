Class {
	#name : #TypShaGtGtPhlowView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowView class >> shadowedClass [
	^ GtPhlowView class
]

{ #category : #shadow }
TypShaGtGtPhlowView >> mActionStencil: aLookup [
	<typShaMethod: 'actionStencil:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(BlockClosure typAsFunctionTypeWithResult: BlElement typAsType)}
]
