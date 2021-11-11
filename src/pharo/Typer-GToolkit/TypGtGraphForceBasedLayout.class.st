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

{ #category : 'accessing' }
TypGtGraphForceBasedLayout >> runLayoutSimply [
	nbIterations = 0
		ifTrue: [ 
			[ 
			alpha := alpha * 0.9.
			alpha > 0.05 ] whileTrue: [ self step ] ]
		ifFalse: [ 
			nbIterations
				timesRepeat: [ 
					alpha := alpha * 0.9.
					self step ] ]
]
