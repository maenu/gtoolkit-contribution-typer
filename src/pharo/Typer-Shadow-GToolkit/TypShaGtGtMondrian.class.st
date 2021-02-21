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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianEdgeBuilder typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMondrian >> mLayout: aLookup [ 
	<typShaMethod: 'layout'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianLayoutBuilder typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMondrian >> mNodes: aLookup [ 
	<typShaMethod: 'nodes'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianNodeBuilder typAsType ];
		yourself
]
