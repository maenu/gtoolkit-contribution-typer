Class {
	#name : #TypShaGtGtMondrian,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrian class >> shadowedClass [
	^ GtMondrian class
]

{ #category : #shadow }
TypShaGtGtMondrian >> mEdges: aLookup [
	<typShaMethod: 'edges'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianEdgeBuilder typAsType
]

{ #category : #shadow }
TypShaGtGtMondrian >> mLayout: aLookup [
	<typShaMethod: 'layout'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianLayoutBuilder typAsType
]

{ #category : #shadow }
TypShaGtGtMondrian >> mNodes: aLookup [
	<typShaMethod: 'nodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianNodeBuilder typAsType
]
