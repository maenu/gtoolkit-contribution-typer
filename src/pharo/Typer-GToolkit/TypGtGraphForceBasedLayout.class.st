Class {
	#name : 'TypGtGraphForceBasedLayout',
	#superclass : 'GtGraphForceBasedLayout',
	#category : 'Typer-GToolkit'
}

{ #category : 'accessing' }
TypGtGraphForceBasedLayout >> prepareNodes: someElements [

	super prepareNodes: someElements.
	someElements do: [ :e | 
		self set: e charge: (e extent max / 2) squared negated ]
]
