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
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMondrian >> mLayout: aLookup [
	<typShaMethod: 'layout'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianLayoutBuilder typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtMondrian >> mNodes: aLookup [
	<typShaMethod: 'nodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMondrianNodeBuilder typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
