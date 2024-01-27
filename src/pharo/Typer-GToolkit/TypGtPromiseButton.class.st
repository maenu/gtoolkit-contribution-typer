Class {
	#name : #TypGtPromiseButton,
	#superclass : #BrButton,
	#instVars : [
		'promise',
		'tooltip'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtPromiseButton >> action: aBlock [
	super
		action: [ promise state isPending
				ifTrue: [ promise cancelHard ]
				ifFalse: [ self icon: BrGlamorousIcons more.
					promise := aBlock asAsyncFuture await.
					promise
						then: [ self icon: BrGlamorousIcons accept ]
						otherwise: [ self icon: BrGlamorousIcons cancel ] ] ]
]

{ #category : #accessing }
TypGtPromiseButton >> initialize [
	super initialize.
	promise := [ 'not run yet' ] asAsyncPromise.
	promise wait.
	self
		aptitude: BrGlamorousButtonWithIconAndLabelAptitude
				+ (tooltip := BrGlamorousWithTooltipAptitude
							content: [ (GtInspectorTool forObject: promise) asElement
									hExact: 400;
									vExact: 300;
									preventChildrenMouseEvents;
									when: BlClickEvent do: [ self phlow spawnObject: promise ];
									yourself ]).
	self icon: BrGlamorousIcons play
]
