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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianEdgeBuilder typAsType
]

{ #category : #shadow }
TypShaGtGtMondrian >> mLayout: aLookup [
	<typShaMethod: 'layout'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianLayoutBuilder typAsType
]

{ #category : #shadow }
TypShaGtGtMondrian >> mNodes: aLookup [
	<typShaMethod: 'nodes'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianNodeBuilder typAsType
]
