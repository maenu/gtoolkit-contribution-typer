Class {
	#name : #TypShaGtGtMondrianNodeBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrianNodeBuilder class >> shadowedClass [
	^ GtMondrianNodeBuilder class
]

{ #category : #shadow }
TypShaGtGtMondrianNodeBuilder >> mWith: aLookup [
	<typShaMethod: 'with:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ((aLookup arguments at: 1) copyWithParameters: {BlElement typAsType})
		arguments: {Collection typAsType}
]
