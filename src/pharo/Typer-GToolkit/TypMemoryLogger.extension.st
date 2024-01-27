Extension { #name : #TypMemoryLogger }

{ #category : #'*Typer-GToolkit' }
TypMemoryLogger >> typGtContextTreeFor: aView [
	<gtView>
	| before after groups root current |
	before := DateAndTime epoch.
	after := DateAndTime now.
	groups := ((recordings
			select: [ :s | 
				{TypInfContextStartSignal.
					TypInfContextStopSignal} includes: s class ]) groupedBy: #node) values
			asOrderedCollection.
	root := current := {#start -> nil.
				#stop -> nil.
				#parent -> nil.
				#children -> OrderedCollection new} asOrderedDictionary.
	[ groups isEmpty ]
		whileFalse: [ | next parent |
			next := groups removeFirst.
			next := {#start
						-> (next detect: [ :s | s isKindOf: TypInfContextStartSignal ]).
					#stop
						-> (next detect: [ :s | s isKindOf: TypInfContextStopSignal ] ifNone: nil).
					#parent -> nil.
					#children -> OrderedCollection new} asOrderedDictionary.
			parent := current.
			[ parent isNotNil
				and: [ ((parent at: #stop) ifNotNil: #timestamp ifNil: before)
						< ((next at: #stop) ifNotNil: #timestamp ifNil: after) ] ]
				whileFalse: [ parent := parent at: #parent ].
			parent ifNil: [ parent := root ].
			next at: #parent put: parent.
			(parent at: #children) add: next.
			current := next ].
	^ aView columnedTree
		title: 'Tree' translated;
		priority: 10;
		expandSuchThat: [ true ];
		actionUpdateButton;
		items: [ root at: #children ];
		children: [ :d | d at: #children ];
		column: 'Contents' translated
			text: [ :d | String streamContents: [ :s | (d at: #start) node printOn: s ] ]
]

{ #category : #'*Typer-GToolkit' }
TypMemoryLogger >> typGtContextsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Contexts' translated;
		priority: 10;
		actionUpdateButton;
		items: [ (((recordings select: [ :s | s isKindOf: TypInfContextStopSignal ])
				groupedBy: #node) collect: [ :c | c sum: #duration ]) associations
				sorted: [ :a :b | a value > b value ] ];
		updateWhen: TypInfContextStopSignal in: [ announcer ];
		column: 'Duration' translated
			text: [ :a | a value ]
			width: 120;
		column: 'Contents' translated
			text: [ :c | String streamContents: [ :s | c printOn: s ] ];
		send: #key
]
