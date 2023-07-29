/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2022- The GROMACS Authors
 * and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
 * Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
 *
 * GROMACS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * GROMACS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GROMACS; if not, see
 * https://www.gnu.org/licenses, or write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * If you want to redistribute modifications to GROMACS, please
 * consider that scientific software is very special. Version
 * control is crucial - bugs must be traceable. We will be happy to
 * consider code for inclusion in the official distribution, but
 * derived work must not be called official GROMACS. Details are found
 * in the README & COPYING files - if they are missing, get the
 * official version at https://www.gromacs.org.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out https://www.gromacs.org.
 */
#ifndef GMX_CONTRIBUTORS_H
#define GMX_CONTRIBUTORS_H

/*! \internal \file
 * \brief
 * Contributor information from the build system.
 *
 * Used for log output.
 */
#include <string>
#include <vector>


namespace gmx
{

inline const std::vector<std::string> currentContributors
{
    "Mark Abraham",
    "Andrey Alekseenko",
    "Cathrine Bergh",
    "Christian Blau",
    "Eliane Briand",
    "Kevin Boyd",
    "Oliver Fleetwood",
    "Stefan Fleischmann",
    "Vytas Gapsys",
    "Gaurav Garg",
    "Gilles Gouaillardet",
    "Alan Gray",
    "Victor Holanda",
    "M. Eric Irrgang",
    "Joe Jordan",
    "Christoph Junghans",
    "Prashanth Kanduri",
    "Sebastian Kehl",
    "Sebastian Keller",
    "Carsten Kutzner",
    "Magnus Lundborg",
    "Pascal Merz",
    "Dmitry Morozov",
    "Szilard Pall",
    "Roland Schulz",
    "Michael Shirts",
    "David van der Spoel",
    "Alessandra Villa",
    "Sebastian Wingbermuehle",
    "Artem Zhmurov",
};

inline const std::vector<std::string> previousContributors
{
    "Emile Apol",
    "Rossen Apostolov",
    "James Barnett",
    "Herman J.C. Berendsen",
    "Par Bjelkmar",
    "Viacheslav Bolnykh",
    "Aldert van Buuren",
    "Carlo Camilloni",
    "Rudi van Drunen",
    "Anton Feenstra",
    "Gerrit Groenhof",
    "Bert de Groot",
    "Anca Hamuraru",
    "Vincent Hindriksen",
    "Aleksei Iupinov",
    "Dimitrios Karkoulis",
    "Peter Kasson",
    "Jiri Kraus",
    "Per Larsson",
    "Justin A. Lemkul",
    "Viveca Lindahl",
    "Erik Marklund",
    "Pieter Meulenhoff",
    "Vedran Miletic",
    "Teemu Murtola",
    "Sander Pronk",
    "Alexey Shvetsov",
    "Alfons Sijbers",
    "Peter Tieleman",
    "Jon Vincent",
    "Teemu Virolainen",
    "Christian Wennberg",
    "Maarten Wolf",
};

inline const std::vector<std::string> currentProjectLeaders
{
    "Paul Bauer",
    "Berk Hess",
    "Erik Lindahl",
};

inline const std::string copyrightText
{
    "Copyright 1991-2022 The GROMACS Authors."
};

} // namespace gmx

#endif // GMX_CONTRIBUTORS_H
