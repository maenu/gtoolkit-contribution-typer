Extension { #name : 'SpaceTallyItem' }

{ #category : '*Typer-Core' }
SpaceTallyItem >> typDiff: anItem [

	^ self class
		  analyzedClassName: analyzedClassName
		  codeSize: anItem codeSize - codeSize
		  instanceCount: anItem instanceCount - instanceCount
		  spaceForInstances: anItem spaceForInstances - spaceForInstances
]

{ #category : '*Typer-Core' }
SpaceTallyItem >> typIsZero [

	^ codeSize = 0 and: [ 
		  instanceCount = 0 and: [ spaceForInstances = 0 ] ]
]

{ #category : '*Typer-Core' }
SpaceTallyItem class >> typNil: aClassName [

	^ self new
		  analyzedClassName: aClassName;
		  codeSize: 0;
		  instanceCount: 0;
		  spaceForInstances: 0;
		  yourself
]
