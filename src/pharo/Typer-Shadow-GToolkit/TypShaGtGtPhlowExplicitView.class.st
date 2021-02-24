Class {
	#name : #TypShaGtGtPhlowExplicitView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowExplicitView class >> shadowedClass [
	^ GtPhlowExplicitView class
]

{ #category : #shadow }
TypShaGtGtPhlowExplicitView >> mStencil: aLookup [
	<typShaMethod: 'stencil:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(BlockClosure typAsFunctionTypeWithResult: BlElement typAsType)}
]
