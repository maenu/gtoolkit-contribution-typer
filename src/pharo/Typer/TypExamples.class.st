Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Examples'
}

{ #category : #example }
TypExamples >> example [
	<gtExample>
	(TypClassLookupIndex
		reset;
		instance)
		resolver:
			(TypCachingLookupResolver new
				resolver:
					(TypBreadthLookupResolver new
						resolvers:
							{(TypDepthLookupResolver new
								resolver:
									(TypBreadthLookupResolver new
										resolvers:
											{TypPraClassLookupResolver new.
											TypShaClassLookupResolver new};
										yourself);
								yourself).
							(TypDepthLookupResolver new
								resolver: TypInfClassLookupResolver new;
								yourself)};
						yourself);
				yourself).
	(TypMethodLookupIndex
		reset;
		instance)
		resolver:
			(TypCachingLookupResolver new
				resolver:
					(TypBreadthLookupResolver new
						resolvers:
							{(TypDepthLookupResolver new
								resolver:
									(TypBreadthLookupResolver new
										resolvers:
											{TypPraMethodLookupResolver new.
											TypShaMethodLookupResolver new};
										yourself);
								yourself).
							(TypDepthLookupResolver new
								resolver: TypInfMethodLookupResolver new;
								yourself)};
						yourself);
				yourself).
	(TypVariableLookupIndex
		reset;
		instance)
		resolver:
			(TypCachingLookupResolver new
				resolver:
					(TypBreadthLookupResolver new
						resolvers:
							{(TypDepthLookupResolver new
								resolver:
									(TypBreadthLookupResolver new
										resolvers:
											{TypPraVariableLookupResolver new.
											TypShaVariableLookupResolver new};
										yourself);
								yourself).
							(TypDepthLookupResolver new
								resolver: TypInfVariableLookupResolver new;
								yourself)};
						yourself);
				yourself).
	^ self
]

{ #category : #example }
TypExamples >> example2 [
	<gtExample>
	self perform: #asString.
	^ self class lookupSelector: #example2
]

{ #category : #example }
TypExamples >> example2: x [
	<gtExample>
	<typTypeArgument: 1 as: 'Integer'>
	x
]

{ #category : #accessing }
TypExamples >> playground [
	| o c s d |
	o := 10 atRandom > 5
		ifTrue: [ Object new ]
		ifFalse: [ Dictionary new ].
	c := OrderedCollection new "typParameters Point".
	s := self.
	d := (c select: [ :e | e abs > 1 ]) collect: [ :e | 4 ].
	o.
	c.
	s
]
